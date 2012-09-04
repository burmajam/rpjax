//= require jquery.pjax
//= require_self

Rpjax =
  pjaxifyLinks: () ->
    $(document).on 'click', 'a[data-target-workspace]', (event) ->
      container = "[data-workspace=#{$(this).attr('data-target-workspace')}]"
      $.pjax.click event, container

  pjaxifyForms: () ->
    $('form[data-target-workspace]').live 'submit', (event) ->
      event.preventDefault()
      $.pjax
        container: "[data-workspace=#{$(this).data('target-workspace')}]"
        url: this.action
        data: $(this).serialize()
        type: this.method

  # Looks if there are elements with data-content-for attribute in pjax response
  # and relocates them into div which has same value in it's data-workspace attribute
  # Example:
  #
  # Part of PJAX response
  # <div data-content-for="flash">
  #   FLASH 545
  # </div>
  #
  # will result with moving content into div:
  #
  # <div data-workspace="flash"> FLASH 921 </div>
  # and removing original div
  pjaxifyResponse: () ->
    movingParts = $('div[data-content-for]')
    for part in movingParts
      ((part) ->
        target_workspace = $(part).data 'content-for'
        $("div[data-workspace=#{target_workspace}]").html $("[data-content-for=#{target_workspace}]").html()
        $("[data-content-for=#{target_workspace}]").remove()
      )(part)

jQuery ->
  Rpjax.pjaxifyResponse()
  Rpjax.pjaxifyLinks()
  Rpjax.pjaxifyForms()

  $(document).on "pjax:end", () ->
    Rpjax.pjaxifyResponse()
