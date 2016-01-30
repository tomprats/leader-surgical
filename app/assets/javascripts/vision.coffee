$(document).ready ->
  if $("body.pages-vision").length > 0
    $(document).on "click", ".iframe-scroller", ->
      $(this).find("iframe").css("pointer-events", "auto")
