

**Warning**: 
- If you start the application without having access to the application database when logging in in student mode or trying to log in in personal mode, you will be notified, but with a very slow speed. It is being investigated to increase the speed.
- Being a project aimed at a subject at my university, which is given in the Turkish language, you will see such language in small sections, a brief explanation will also be given in English.
	

# Contents

- Information
	- Advertisers
	- Students
- Design of Relational Database
	- Data Requirements
	- Enhanced Entity Relationship Diagram
	- EER to Relational Mapping
- Small Details That I Would Like To Highlight
- Screenshots

# Introduction

The aim of this project will be to provide the services that students need most, to fix some of the information distribution problems identified in our academic center and at the same time to provide the user with a pleasant and welcoming experience and an elegant and simple design.

Students will benefit from the options available in all the existing web-based student information system offered by our university, and also new services will be provided such as seeing some information shared from other sub-areas of our university in a full package. In addition, a new communication channel will be provided between university staff and students to propose the issue of distribution of information.

The audience of the project will be for all undergraduate, associate degree, graduate and doctorate students in our educational institution, as well as faculty, department and student affairs personnel.

In order to realize this project, the current student information system of our education center provided on the web will be used. The reason for this is that there is no access to the 'Application Programming Interface' used by our education center, and it will also be a plus that every option available from our education center's current student information system can be taken fully ready. Thus, they will learn about the functioning of a large and functional application, and at the same time, it will help us to complete the deficiencies in this web-based student information system application.

The application can be summarized in two sections, the section for advertisers and the section for students.

## Advertisers

- There will be types of personnel who will post advertisements to students, the intended types of advertisers are career, college and student affairs advertisers.
- Advertisements from career advertisers can only be seen by certain students studying in those degrees.
- The announcements of the advertisers of faculties will only be able to be seen by the determined students who study in those faculties.
- Student affairs announcements will be seen by all students.
- The content of the ads will be HTML, in the GUI CSS tags will be left prepared so that the text has automatic break lines for the space of the page and the sizes of the photographs and videos will also be determinedly adjusted so that the content can be downloaded saved. Clearly, if the staff wants to, they can change the CSS values ​​within the content they publish. Continuously look at the screenshots of the project to better understand what was said.
- The section for advertisers will literally be a CRUD application so they can organize their ads.

## Students
- All the services of the university will be provided, with the difference that it will try to provide the most used services within the minimum scope and also information will be given which are spaced by subdomains of the university.
- The career and faculty to which the student belongs will be determined by the information of the university system and thus the required announcements will be shown to the student published by the related advertisers.
- The key services will be provided. When doing this, the browser's new tab options had to be manipulated and redirections had to be forced.
- The user will be given their class agenda information with a windows form datagrid component.
- The names of the professors who teach in the current semester will be obtained and their e-mails will be searched via the internet, if they are found they will be taught as validated to the student, if they will not be deduced, this is because the university uses a format, equally Validation will be important to avoid giving incorrect information to the student.
- All university services will be provided by redirecting students to the university page with their sessions already active.
- They will be shown the photographic type library announcements in the GUI menu with the help of a timer component. This is not provided by the university's student information system.
- They will be shown advertisements from a university advertisement subdomain, this is also not provided by the university's student information system.
- The advertisements of the database will be shown which are related to the student's fields.


# Design of Relational Database 

Our objective will be that the types of announcers publish announcements to different categories of students, by categories we refer to departments or faculties. It will also give developers the freedom to develop a model that is open to possible future additions, such as adding new additions. To develop the relational database model mentioned above, we must first consider the data requirements.

## Data Requirements

- There will be announcers, they will be department announcers, faculty announcers and student affairs announcers.
- An advertiser can belong to only one class, not more than one class, or any one class because it wouldn't make sense.
- A department can have more than one staff member, each department announcer staff must belong to a department.
- A faculty can have more than one staff member, each faculty announcer staff must belong to a department.
- The registrations of the announcers should be differentiated and they will be made with the national identification numbers of the announcers. Their first and last names will also be recorded. In addition, announcers will have passwords to enter the system.
- An advertiser may belong to a faculty or department, so the university has
We must keep the names of their faculties and departments, they cannot have the same name, so their names will be distinctive.
- Faculties and departments must be interconnected because each department belongs to only one faculty. More than one department can belong to a faculty.
- Announcements will be published by the previously mentioned subclasses (we can also say that superclass announcers will), these announcements should be differentiated, can be made according to the date and time, but there is a slight chance that two or more announcements will be shared on the same date and time. Also, announcements can be distinguished by the title of the announcements, but there is also the possibility that two or more different announcers want to publish an announcement with the same name, so this option is also not suitable. They will have special numbers to distinguish the announcement records. In addition, the content information and dates of the announcements will be recorded.

## Enhanced Entity Relationship Diagram

![](https://drive.google.com/uc?id=1NqCQRBtv9IGpi4kZbPB4IXF9dI8ssn4G)

## EER to Relational Mapping

Remember that there is an algorithm which suggests steps to do the said conversion.

![](https://image.slidesharecdn.com/ereertorelationalmapping-120305102127-phpapp02/95/er-eer-to-relational-mapping-2-728.jpg?cb=1330943956)

To make the process faster, I'll skip doing iterations, starting first with step number 8 and then continuously with step number 1.

![](https://drive.google.com/uc?id=17JhSsrbCmqvYcm5uE3wUChzXzMGHTK2e)
![](https://drive.google.com/uc?id=1QWYhNahjUQVsSvdBgoMHCH8l8jNWDi5h)

In the figures shown, the finalized results when performing mapping are directly shown in green.

There is one point in the mapping process that I need to highlight. I had to implement the option to create separate tables in step 8, because super class and sub class have relationships, if I had used other options each implemented table would have many columns, this would cause additional data cost. For this reason, it has been determined that the option we applied is the most optimized.
Let's see how to create a relational model with the results of the mapping operation.

![](https://drive.google.com/uc?id=1PNX3HOoCTDWjqJh13HiAzalg9AzW5Gvl)

As shown in the figure, foreign key connections are shown with arrows.
After this point, it remains to pass to SQL, where the tables, constraints and triggers must be determined.

# Small Details That I Would Like To Highlight

- The faculty and career of the student is automatically detected via the university system, the indicated announcements are continuously shown to the student.
- All the new tab options had to be removed from the browser and replaced by redirects to the pages.
- It has been necessary to collect all the information from the university pages manually, with HTTP requests, it has been necessary in some situations to save cookies and you enter situations to do things manually without the user noticing, such as logging in to the distance learning system of the university due to the fact that the cookies related to the page could not be obtained.
- Automatic scrolldowns have been adjusted to the university news so that the user only sees the content they want.
- Base64 encoding has been used to obtain and display the photos.

# Screenshots

![](https://drive.google.com/uc?id=1R14PjuEqafAhqfQOtuMAA606mr3_Vcwv)
![](https://drive.google.com/uc?id=1eQskhNa0FHSaig_xYpukFEz8_aQ3G_DR)
![](https://drive.google.com/uc?id=1800t4xrQHdiP-78DpeYqXLO1knG6xmxx)
![](https://drive.google.com/uc?id=140OLYh-rxO-QsngSJuE9zd-7boViiI9V)
![](https://drive.google.com/uc?id=1COxFF-PFPqZwNFXYHs5TJADNZgGT1Uc-)
![](https://drive.google.com/uc?id=1-PPZPMATKSoykGAZOUe24DpE8a7mb6rF)
![](https://drive.google.com/uc?id=12jWwaGm8Aqterdvp_7vYGWzuV0U95vwB)
![](https://drive.google.com/uc?id=14XqwK4fQ2qLKaLHU7uxPLJNEbkB7ZOzF)
![](https://drive.google.com/uc?id=1C6XH_nQUzE3W39uCRJLFkeIA_rDNp-6O)
![](https://drive.google.com/uc?id=1LW2CWQZqYA3swqeIzUNjoMdXQF0_-iGR)
![](https://drive.google.com/uc?id=1SMj6fg2EWgeeYLprWOt9P9ovUqp33QMu)
![](https://drive.google.com/uc?id=1lRAj1Sq72QbcSAC4yFAF4vgz4_6L3hNb)
![](https://drive.google.com/uc?id=1nNirh4vNU4jZUsA-hkl7tZWPUVucOzks)
![](https://drive.google.com/uc?id=1qnyFc9VuLo__bL5EMWdQglEpatXBepSR)
