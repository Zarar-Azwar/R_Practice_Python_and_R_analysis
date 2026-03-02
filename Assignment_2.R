# we will create a simple dataset of Siparadigm Islamabad Employees
# In this dataset we have data of 7 employees
# we have 5 features 
# employee_id (integer datatype)
# employee_name (string datatype)
# salary (integer datatype)
# designation (string datatype)
# qualification (string datatype)


sip_office <- data.frame(
  employee_id = c(161, 162, 163, 164, 165, 166, 167),
  employee_name = c("Affan", "Hassaan", "Usama", "Maaz", "Ubair", "Asaad", "Umar"),
  salary = c(500000, 600000, 300000, 400000, 200000, 400000, 700000),
  designation = c("Software Engineer", "Team Lead", "Junior Developer", "R&D Expert", "HR Manager",
                  "Senior AI Engineer", "IT Manager"),
  qualification = c("MSSE", "MSAI", "MSCS", "MSDS", "MBA", "BSAI", "BSIT")
)


# using View function to view dataframe
View(sip_office)
