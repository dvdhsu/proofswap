# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  filepicker.setKey("Ans6MgPN6QUmtmP6WJBVmz")

  store = (urlField, titleField, callback) ->
    filepicker.pick({
        mimetypes: ['text/*', 'application/msword', 'application/pdf',
                    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
        services: ['COMPUTER', 'BOX', 'DROPBOX', 'GMAIL', 'GOOGLE_DRIVE', 'URL'],
        openTo: 'COMPUTER'
      },
      (Blob) ->
        full_filename = Blob.filename
        # remove filename extension
        index = full_filename.lastIndexOf('.')
        filename = full_filename.substring(0, index)

        urlField.val(Blob.url)
        titleField.val(filename)
        callback();
    )

  $('.addPaperButton').click ->
    # numerical id (e.g. `3')
    id = this.id.substr(this.id.length - 1)
    store($('#addPaperForm' + id).children("input#add_paper_filepicker_url"),
          $('#addPaperForm' + id).children("input#add_paper_title"),
          () -> $('#addPaperForm' + id).submit())

  $('#uploadButton').click ->
    store($('#new_swap_filepicker_url'), $('#new_swap_title'), $.noop)
