if User.count.zero?
  User.create(
    admin: true,
    email: "tprats108@gmail.com",
    first_name: "Tom",
    last_name: "Prats",
    password: "password"
  )
end

if Specialty.count.zero?
  breast_care = kind = Specialty.create(active: true, name: "Breast Care")
  kind_names = ["Breast Cancer", "Breast Biopsy", "Breast Lumps & Cysts", "Breast Pain", "Abnormal Mammograms", "Stereotactic Needle Core Biopsy-Mammotome", "Sentinel Lymph Node Biopsy"]
  kind.children = kind_names.collect do |name|
    Specialty.find_or_create_by(active: true, name: name)
  end

  kind = Specialty.create(active: true, name: "Cancer")
  kind_names = ["Colon", "Stomach", "Bile Duct & Gallbladder", "Liver", "Pancreas", "Thyroid", "Skin (Basal, Squamous & Melanoma)", "Sarcomas", "Lymphomas", "Insertions of Ports for Chemotherapy", "Sentinel Lymph Node Biopsy"]
  kind.children = kind_names.collect do |name|
    Specialty.find_or_create_by(active: true, name: name)
  end

  kind = Specialty.create(active: true, name: "Colorectal Treatment")
  kind_names = ["Diverticulitis", "Colon Polyps & Cancer", "Hemorrhoids", "Rectal Prolapse", "Perirectal Abscess", "Anal Fistula", "Anal Fissure", "Fecal Incontinence"]
  kind.children = kind_names.collect do |name|
    Specialty.find_or_create_by(active: true, name: name)
  end

  kind = Specialty.create(active: true, name: "Laparoscopic Surgery")
  kind_names = ["Gallbladder Removal", "Inguinal Hernia Repair", "Incisional Hernia Repair", "Hiatal Hernia Repair", "Anti-Reflux Surgery", "Colon Surgery", "Splenectomy", "Appendectomy"]
  kind.children = kind_names.collect do |name|
    Specialty.find_or_create_by(active: true, name: name)
  end

  hernia_surgery = kind = Specialty.create(active: true, name: "Hernia Surgery")
  kind_names = ["Umbilical", "Incisional", "Hiatal", "Ventral"]
  kind.children = kind_names.collect do |name|
    Specialty.find_or_create_by(active: true, name: name)
  end

  kind = Specialty.create(active: true, name: "Pediatric Surgery")
  kind_names = ["Umbilical Hernia", "Inguinal Hernia Repair", "Appendicitis"]
  kind.children = kind_names.collect do |name|
    Specialty.find_or_create_by(active: true, name: name)
  end

  kind = Specialty.create(active: true, name: "Skin Lesions")
  kind_names = ["Lipomas", "Melanomas", "Basal Cell Cancers", "Squamous Cell Cancers", "Benign Skin Cysts", "Pilonidal Cysts"]
  kind.children = kind_names.collect do |name|
    Specialty.find_or_create_by(active: true, name: name)
  end

  endoscopy = kind = Specialty.create(active: true, name: "Endoscopy")
  kind_names = ["Colonoscopy", "Sigmoidoscopy", "Polypectomy", "Esophagogastro Duodenoscopy (EGD)"]
  kind.children = kind_names.collect do |name|
    Specialty.find_or_create_by(active: true, name: name)
  end
end

if Doctor.count.zero?
  breast_care ||= Specialty.find_by(name: "Breast Care")
  doc = Doctor.create(
    active: true,
    image: "partners/mudge.jpg",
    first_name: "Kim",
    last_name: "Mudge",
    description: "Kim has a heart for patients with Breast Cancer. She continues to study, ensuring her patients get the best care.",
    kind: "FACS",
    specialty_id: breast_care.id
  )
  breast_care.update(doctor_id: doc.id)

  endoscopy ||= Specialty.find_by(name: "Endoscopy")
  doc = Doctor.create(
    active: true,
    image: "partners/nicholson.jpg",
    first_name: "Thomas",
    last_name: "Nicholson",
    description: "Tommy pays close attention to innovation in Colon and Rectal surgery, attending numerous conferences every year.",
    kind: "FACRS",
    specialty_id: endoscopy.id
  )
  endoscopy.update(doctor_id: doc.id)

  hernia_surgery ||= Specialty.find_by(name: "Hernia Surgery")
  doc = Doctor.create(
    active: true,
    image: "partners/prats.jpg",
    first_name: "Ignacio",
    last_name: "Prats",
    description: "Iggy has a passion for Hernia Surgery, focusing on minimally invasive procedures utilizing Laparoscopic technology.",
    kind: "FACS",
    specialty_id: hernia_surgery.id
  )
  hernia_surgery.update(doctor_id: doc.id)
end

if Visit.count.zero?
  before = Visit.find_or_create_by(
    active: true,
    rank: 100,
    name: "Before Your Visit"
  )

  Visit.create(
    active: true,
    rank: 100,
    name: "What to Expect",
    description: "Expect wonderful doctors and nurses all along the way.",
    parent_id: before.id
  )

  forms = Visit.find_or_create_by(
    active: true,
    rank: 200,
    name: "Forms",
    parent_id: before.id
  )

  Visit.create(
    active: true,
    rank: 100,
    name: "New Patient",
    description: "Forms for new patients to fill out.",
    parent_id: forms.id
  )

  Visit.create(
    active: true,
    rank: 200,
    name: "HIPPA",
    description: "Forms for HIPPA compliance.",
    parent_id: forms.id
  )

  Visit.create(
    active: true,
    rank: 300,
    name: "Insurance & Self-Pay",
    parent_id: before.id
  )

  Visit.create(
    active: true,
    rank: 300,
    name: "Insurance & Self-Pay",
    parent_id: before.id
  )

  Visit.create(
    active: true,
    rank: 400,
    name: "Patient Education on Copay, Deductibles, Co-Ins",
    parent_id: before.id
  )

  during = Visit.find_or_create_by(
    active: true,
    rank: 200,
    name: "During Your Visit"
  )

  Visit.create(
    active: true,
    rank: 100,
    name: "Where We Perform Services",
    parent_id: during.id
  )

  Visit.create(
    active: true,
    rank: 200,
    name: "Transparent Charges",
    parent_id: during.id
  )

  Visit.create(
    active: true,
    rank: 300,
    name: "Disclosure Statement",
    parent_id: during.id
  )

  after = Visit.find_or_create_by(
    active: true,
    rank: 300,
    name: "After Your Visit"
  )

  Visit.create(
    active: true,
    rank: 100,
    name: "Follow Up Appointment",
    parent_id: after.id
  )
end
