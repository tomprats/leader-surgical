$ ->
  $(document).on "click", ".open-sesame", (e) ->
    e.preventDefault()
    $this = $(this)
    id = $this.data("id")
    $(".modal").removeClass("fade").modal("hide")
    if $this.data("type") == "doctor"
      setDoctorModal(id)
    else if $this.data("type") == "specialty"
      setSpecialtyModal(id)
    else if $this.data("type") == "procedure"
      setProcedureModal(id)
    return false

  setDoctorModal = (id) ->
    $modal = $("#doctor-modal")
    $.get "doctors/#{id}", (data) ->
      $modal.find(".image").attr("src", data.image)
      $modal.find(".name").text(data.name)
      $modal.find(".kind").text(data.kind)
      $specialty = $modal.find(".specialty")
      $specialty.data("id", data.specialty.id)
      $specialty.text(data.specialty.name)
      $associations = $modal.find(".associations")
      if data.associations && data.associations != ""
        $associations.closest("p").removeClass("hidden")
        $associations.text(data.associations)
      else
        $associations.closest("p").addClass("hidden")
      $procedures = $modal.find(".procedures")
      $procedures.empty()
      if data.procedures && data.procedures.length > 0
        $procedures.closest("p").removeClass("hidden")
        $base = $modal.find(".procedure").clone().removeClass("hidden")
        for procedure, i in data.procedures
          $procedure = $base.clone()
          $procedure.text(procedure.name)
          $procedure.data("id", procedure.id)
          $procedures.append $procedure
          unless i == data.procedures.length - 1 then $procedures.append ", "
      else
        $procedures.closest("p").addClass("hidden")
      $description = $modal.find(".description")
      if data.description && data.description != ""
        $description.removeClass("hidden")
        $description.html(data.description)
      else
        $description.addClass("hidden")
      $bio = $modal.find(".bio")
      if data.bio && data.bio != ""
        $bio.removeClass("hidden")
        $bio.html(data.bio)
      else
        $bio.addClass("hidden")

      $modal.addClass("fade").modal("show")

  setSpecialtyModal = (id) ->
    $modal = $("#specialty-modal")
    $.get "specialties/#{id}", (data) ->
      $modal.find(".name").text(data.name)
      $doctor = $modal.find(".doctor")
      if data.doctor
        $doctor.closest("p").removeClass("hidden")
        $doctor.data("id", data.doctor.id)
        $doctor.text(data.doctor.name)
      else
        $doctor.closest("p").addClass("hidden")
      $parent = $modal.find(".parent-specialty")
      if data.parent
        $parent.closest("p").removeClass("hidden")
        $parent.data("id", data.parent.id)
        $parent.text(data.parent.name)
      else
        $parent.closest("p").addClass("hidden")
      $procedures = $modal.find(".procedures")
      $procedures.empty()
      if data.procedures && data.procedures.length > 0
        $procedures.closest("p").removeClass("hidden")
        $base = $modal.find(".procedure").clone().removeClass("hidden")
        for procedure, i in data.procedures
          $procedure = $base.clone()
          $procedure.text(procedure.name)
          $procedure.data("id", procedure.id)
          $procedures.append $procedure
          unless i == data.procedures.length - 1 then $procedures.append ", "
      else
        $procedures.closest("p").addClass("hidden")
      $children = $modal.find(".children")
      $children.empty()
      if data.children && data.children.length > 0
        $children.closest("p").removeClass("hidden")
        $base = $modal.find(".child-specialty").clone().removeClass("hidden")
        for child, i in data.children
          $child = $base.clone()
          $child.text(child.name)
          $child.data("id", child.id)
          $children.append $child
          unless i == data.children.length - 1 then $children.append ", "
      else
        $children.closest("p").addClass("hidden")
      $link = $modal.find(".link")
      if data.link && data.link != ""
        $link.closest("p").removeClass("hidden")
        $link.attr("href", data.link)
      else
        $link.closest("p").addClass("hidden")
      $description = $modal.find(".description")
      if data.description && data.description != ""
        $description.removeClass("hidden")
        $description.html(data.description)
      else
        $description.addClass("hidden")

      $modal.addClass("fade").modal("show")

  setProcedureModal = (id) ->
    $modal = $("#procedure-modal")
    $.get "procedures/#{id}", (data) ->
      $modal.find(".name").text(data.name)
      $doctor = $modal.find(".doctor")
      if data.doctor
        $doctor.closest("p").removeClass("hidden")
        $doctor.data("id", data.doctor.id)
        $doctor.text(data.doctor.name)
      else
        $doctor.closest("p").addClass("hidden")
      $specialty = $modal.find(".specialty")
      if data.specialty
        $specialty.closest("p").removeClass("hidden")
        $specialty.data("id", data.specialty.id)
        $specialty.text(data.specialty.name)
      else
        $specialty.closest("p").addClass("hidden")
      $link = $modal.find(".link")
      if data.link && data.link != ""
        $link.closest("p").removeClass("hidden")
        $link.attr("href", data.link)
      else
        $link.closest("p").addClass("hidden")
      $description = $modal.find(".description")
      if data.description && data.description != ""
        $description.removeClass("hidden")
        $description.html(data.description)
      else
        $description.addClass("hidden")

      $modal.addClass("fade").modal("show")
