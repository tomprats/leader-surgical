$ ->
  options = ->
    {
      alwaysOn: true,
      stroke: false,
      fill: true,
      fillOpacity: 1,
    }

  resetAreas = ->
    $("area").each ->
      $this = $(this)
      data = options()
      data.fillColor = $this.data("color")
      $this.data("maphilight", data)
      $this.trigger("alwaysOn.maphilight")

  setBodyPartPanel = (id) ->
    $panel = $(".procedure")
    $.get "body_parts/#{id}", (data) ->
      $panel.find(".name").text(data.name)
      $doctor = $panel.find(".doctor")
      if data.doctor
        $doctor.closest("p").removeClass("hidden")
        $doctor.data("id", data.doctor.id)
        $doctor.text(data.doctor.name)
      else
        $doctor.closest("p").addClass("hidden")
      $procedures = $panel.find(".procedures")
      $procedures.empty()
      if data.procedures && data.procedures.length > 0
        $procedures.closest("p").removeClass("hidden")
        $base = $panel.find(".procedure").clone().removeClass("hidden")
        for procedure, i in data.procedures
          $procedure = $base.clone()
          $procedure.text(procedure.name)
          $procedure.data("id", procedure.id)
          $procedures.append $procedure
          unless i == data.procedures.length - 1 then $procedures.append ", "
      else
        $procedures.closest("p").addClass("hidden")
      $description = $panel.find(".description")
      if data.description && data.description != ""
        $description.removeClass("hidden")
        $description.html(data.description)
      else
        $description.addClass("hidden")

      $(".instructions").addClass("hidden")
      $(".body-part").removeClass("hidden")

  if $("body.pages-services").length > 0
    $.fn.maphilight.defaults = Object.assign({}, $.fn.maphilight.defaults, options())
    $(".person-img").maphilight()
    resetAreas()

    $(document).on "click", "area", (e) ->
      e.preventDefault()
      resetAreas()
      data = options()
      data.stroke = true
      data.strokeColor = "EA523F"
      data.strokeOpacity = 1
      data.strokeWidth = 5
      $this = $(this)
      data.fillColor = $this.data("color")
      $this.data("maphilight", data)
      $this.trigger("alwaysOn.maphilight")

      id = $this.data("id")
      setBodyPartPanel(id)

      return false
