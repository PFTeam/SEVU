jQuery(function($) {
    var selector = '[data-autocomplete-url]:not(.ui-autocomplete-input)'

      $(document).on('focus', selector, function() {
            var input  = $(this)
                var source = function(request, response) {
                        $.ajax({
                                  url:      input.data('autocompleteUrl'),
                                          data:     { q: request.term },
                                                  dataType: 'json',
                                                          success:  response
                                                                })
                                                                    }
                                                                        var select = function(event, ui) {
                                                                                $(input.data('autocompleteFor')).val(ui.item.id)
                                                                                    }

                                                                                        input.autocomplete({ source: source, select: select })
                                                                                          })
})
