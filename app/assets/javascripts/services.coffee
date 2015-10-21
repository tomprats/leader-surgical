$(document).ready ->
  if $("body.pages-services").length > 0
    options = ->
      {
        alwaysOn: true,
        stroke: false,
        fill: true,
        fillOpacity: 1,
        fillColor: "CDFFFF"
      }
    $.fn.maphilight.defaults = options()
    $(".person-img").maphilight()

    $(document).on "click", ".person-area", (e) ->
      e.preventDefault()

      $(".person-area").data("maphilight", options())
      data = options()
      data.fillColor = "FF0000"
      $(this).data("maphilight", data)
      $(this).trigger("alwaysOn.maphilight")

      id = $(this).attr("id")
      $(".procedure").addClass("hidden")
      $(".#{id}").removeClass("hidden")

      return false
