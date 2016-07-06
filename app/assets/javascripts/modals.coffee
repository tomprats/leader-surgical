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
        $associations.closest("div").removeClass("hidden")
        $associations.text(data.associations)
      else
        $associations.closest("div").addClass("hidden")
      $procedures = $modal.find(".procedures")
      $procedures.empty()
      if data.procedures && data.procedures.length > 0
        $procedures.closest("div").removeClass("hidden")
        $base = $modal.find(".procedure").clone().removeClass("hidden")
        for procedure, i in data.procedures
          $procedure = $base.clone()
          $procedure.text(procedure.name)
          $procedure.data("id", procedure.id)
          $li = $("<li></li>")
          $li.append $procedure
          $procedures.append $li
      else
        $procedures.closest("div").addClass("hidden")
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
        $doctor.closest("div").removeClass("hidden")
        $doctor.data("id", data.doctor.id)
        $doctor.text(data.doctor.name)
      else
        $doctor.closest("div").addClass("hidden")
      $parent = $modal.find(".parent-specialty")
      if data.parent
        $parent.closest("div").removeClass("hidden")
        $parent.data("id", data.parent.id)
        $parent.text(data.parent.name)
      else
        $parent.closest("div").addClass("hidden")
      $procedures = $modal.find(".procedures")
      $procedures.empty()
      if data.procedures && data.procedures.length > 0
        $procedures.closest("div").removeClass("hidden")
        $base = $modal.find(".procedure").clone().removeClass("hidden")
        for procedure, i in data.procedures
          $procedure = $base.clone()
          $procedure.text(procedure.name)
          $procedure.data("id", procedure.id)
          $li = $("<li></li>")
          $li.append $procedure
          $procedures.append $li
      else
        $procedures.closest("div").addClass("hidden")
      $children = $modal.find(".children")
      $children.empty()
      if data.children && data.children.length > 0
        $children.closest("div").removeClass("hidden")
        $base = $modal.find(".child-specialty").clone().removeClass("hidden")
        for child, i in data.children
          $child = $base.clone()
          $child.text(child.name)
          $child.data("id", child.id)
          $li = $("<li></li>")
          $li.append $child
          $children.append $li
      else
        $children.closest("div").addClass("hidden")
      hide = true
      $pages = $modal.find(".pages")
      $p = $pages.closest("div")
      $p.find(".divider").removeClass("hidden")
      if data.pages && data.pages.length > 0
        page = data.pages[0]
        $pages.attr("href", "/" + page.path)
        $pages.removeClass("hidden")
        hide = false
      else
        $pages.addClass("hidden")
        $p.find(".divider").addClass("hidden")
      $link = $modal.find(".link")
      if data.link && data.link != ""
        $link.attr("href", data.link)
        $link.removeClass("hidden")
        hide = false
      else
        $link.addClass("hidden")
        $p.find(".divider").addClass("hidden")
      if hide
        $p.addClass("hidden")
      else
        $p.removeClass("hidden")
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
        $doctor.closest("div").removeClass("hidden")
        $doctor.data("id", data.doctor.id)
        $doctor.text(data.doctor.name)
      else
        $doctor.closest("div").addClass("hidden")
      $specialty = $modal.find(".specialty")
      if data.specialty
        $specialty.closest("div").removeClass("hidden")
        $specialty.data("id", data.specialty.id)
        $specialty.text(data.specialty.name)
      else
        $specialty.closest("div").addClass("hidden")
      $link = $modal.find(".link")
      if data.link && data.link != ""
        $link.closest("div").removeClass("hidden")
        $link.attr("href", data.link)
      else
        $link.closest("div").addClass("hidden")
      $description = $modal.find(".description")
      if data.description && data.description != ""
        $description.removeClass("hidden")
        $description.html(data.description)
      else
        $description.addClass("hidden")

      $modal.addClass("fade").modal("show")
