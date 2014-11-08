class SwapsController < ApplicationController
  before_action :authenticate_user!, only: [
    :index
  ]

  def index
    @paired_swaps, @unpaired_swaps = current_user.swaps.partition { |swap| swap.users.count > 1 }
  end

  def create
    puts params
    puts params[:new_swap_title]
    puts params[:new_swap_filepicker_url]
    puts params[:new_swap_expires]

    unpaired_swaps = Swap.where(users_count: 1)
    # hacky, but is better than a string condition...
    avail_swaps = unpaired_swaps.to_a.select { |swap| swap.user_ids.exclude? current_user.id }

    expires = DateTime.now

    case params[:new_swap_expires]
    when "24 hours"
      expires = expires.advance(hours: 24)
    else
      expires = expires.advance(days: params[:new_swap_expires].to_s.to_i)
    end

    if avail_swaps.length > 0
      puts "Found a swap."
      swap = avail_swaps.first
      swap.users << current_user
      swap.users_count = swap.users_count + 1

      # pick the earlier expiry date
      swap.expires = expires < swap.expires ? expires : swap.expires

      swap.save!

      swap.papers.create!(
        filepicker_url: params[:new_swap_filepicker_url],
        title: params[:new_swap_title],
        user_id: current_user.id
      )
    else
      puts "Can't find a swap, so making new one."

      swap = current_user.swaps.create!(
        expires: expires,
        users_count: 1
      )

      swap.papers.create!(
        filepicker_url: params[:new_swap_filepicker_url],
        title: params[:new_swap_title],
        user_id: current_user.id
      )
    end
    redirect_to swaps_path
  end

  def update
    current_user.swaps.find(params[:id]).papers.create!(
      filepicker_url: params[:add_paper_filepicker_url],
      title: params[:add_paper_title],
      user_id: current_user.id
    )
    redirect_to swaps_path
  end
end
