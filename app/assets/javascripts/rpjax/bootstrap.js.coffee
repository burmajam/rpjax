jQuery ->
  Rpjax.pjaxifyResponse()
  Rpjax.pjaxifyLinks()
  Rpjax.pjaxifyForms()

  $(document).on "pjax:end", () ->
    Rpjax.pjaxifyResponse()
