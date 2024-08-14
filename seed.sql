-- create database tech_elearn;

-- use tech_elearn;

/* create tables */

create table users (
	`userID` int not null,
    `username` varchar(45) not null,
    `email` varchar(45) not null,
    `password` varchar(45) not null,
    primary key(`userID`) );
    
create table courses (
	`courseID` int not null,
    `course_title` varchar(45) not null,
    `difficulty` varchar(45) not null,
    `video_link` varchar(200) not null,
    `categoryID` int,
    primary key(`courseID`),
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
    );

create table career_path (
	`career_pathID` int not null,
    `description` varchar(1000) not null,
    `categoryID` int,
    primary key(`career_pathID`),
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
    );

create table categories (
	`categoryID` int not null,
    `category` varchar(45) not null,
    primary key(`categoryID`)
    );
	
    
create table forum_questions (
	`questionID` int not null,
    `question` varchar(1000) not null,
    `type` varchar(45) not null,
    `userID` int,
    primary key(`questionID`),
    FOREIGN KEY (userID) REFERENCES users(userID)
    );
    
    create table favorites (
	`userID` int,
    `courseID` int,
    `career_pathID` int,
    primary key(`userID`),
    FOREIGN KEY (userID) REFERENCES users(userID),
	FOREIGN KEY (courseID) REFERENCES courses(courseID),
	FOREIGN KEY (career_pathID) REFERENCES career_path(career_pathID)
    );
    
/* insert data */



insert into users
( userID,username, email, password)
VALUES(
    1,
    'Julie1567',
    'julie.smitth89@gmail.com',
    '2BY^Ut6CZnkjLF8H'
),
(
     2,
    'rob_7412',
    'rob56matthew@hotmail.com',
    'EbLAt2rO&%MIatxL'
),
(
     3,
    'john12_78',
    'smith-john@hotmail.com',
    'TIoU2Ph5DntP4*6M'
),
(
     4,
    'camillewonk678',
    'w.camille@hotmail.com',
    '3k%CFu^t7tCw33fk'
),
(
     5,
    'energy-72',
    'e.567@gmail.com',
    'bgsM9Arpyc%X*GrR'
);

insert into categories
( categoryID,category)
VALUES
	(1,  'Web Development'),
	(2, 'Mobile Development'),
    (3, 'Cloud & Devops'),
    (4, 'Testing'),
    (5, 'Cyber Security'),
    (6, 'AI & Machine learning');
    


insert into courses
(courseID, course_title, difficulty, video_link, categoryID)
VALUES(
    1,
    'Concepts of HTML',
    'Easy',
    'https://www.w3schools.com/html/html_intro.asp',
    1
),
(
     2,
    'What is AWS',
	'Easy',
    'https://www.simplilearn.com/tutorials/aws-tutorial/what-is-aws',
    3
    
),
(
     3,
    'Machine Learning Specialisation',
	'Medium',
    'https://www.coursera.org/specializations/machine-learning-introduction',
     6
),
(
     4,
    'Javascript Tutorital',
	'Medium',
    'https://www.w3schools.com/js/',
    1
),
(
     5,
    'Two-Factor Authentication',
    'Hard',
    'https://authy.com/what-is-2fa/',
    5
);

insert into career_path
(career_pathID, description, categoryID)
VALUES(
    1,
    'The web development journey begins with mastering HTML, CSS, and JavaScript for front-end development. Then, delving into back-end languages like Python or JavaScript (Node.js) and frameworks such as React.js or Express.js enriches ones skill set. Understanding databases, version control with Git, and adhering to security principles are vital steps. Continuous learning and project-building round off the path to becoming a proficient web developer',
    1
),
(
     2,
    'The path to a career in cybersecurity typically starts with understanding foundational concepts like networking, operating systems, and programming languages such as Python or C. Aspirants then delve into specialized areas like ethical hacking, cryptography, and security operations. Gaining certifications like CompTIA Security+, Certified Ethical Hacker (CEH), or Certified Information Systems Security Professional (CISSP) validates expertise and opens doors to diverse roles in cybersecurity, from penetration testing to security analysis and beyond. Continuous learning and staying updated with evolving threats and defense strategies are key to success in this dynamic field.',
    5
    
),
(
     3,
    'Cloud computing and DevOps are intertwined disciplines that revolutionize software development and deployment. Cloud platforms like AWS, Azure, and Google Cloud provide scalable infrastructure for hosting applications and services. DevOps practices streamline the development lifecycle, emphasizing collaboration, automation, and continuous integration/continuous deployment (CI/CD). Mastery of tools like Docker, Kubernetes, Terraform, and Jenkins enables efficient management of infrastructure as code, facilitating rapid development and deployment cycles',
     3
),
(
     4,
    'AI and machine learning represent the frontier of technology, empowering systems to learn from data and make intelligent decisions. Machine learning algorithms analyze vast datasets to identify patterns and insights, enabling tasks like predictive analytics, natural language processing, and computer vision. Deep learning, a subset of machine learning, mimics the human brains neural networks, revolutionizing areas like speech recognition and image classification. ',
	6
),
(
	5, 
    'Mobile development involves creating applications for mobile devices such as smartphones and tablets. Developers typically specialize in either iOS or Android platforms, utilizing languages like Swift or Objective-C for iOS, and Java or Kotlin for Android. Alternatively, cross-platform frameworks like React Native or Flutter enable developers to write code once and deploy it across multiple platforms. With a focus on user experience, performance optimization, and platform-specific features, mobile developers play a crucial role in shaping the digital experiences of millions of users worldwide.',
    2),
    
    (6, 
    'Testing is an essential aspect of software development, ensuring that applications meet quality standards and perform as expected. It encompasses various techniques, including unit testing, integration testing, and end-to-end testing, to validate functionality and detect defects. Test automation tools like Selenium and Cypress streamline the testing process, enabling continuous integration and deployment pipelines. Rigorous testing practices help identify and resolve issues early in the development lifecycle, improving overall software reliability and user satisfaction.',
    4);
    

insert into forum_questions
(questionID, question, type, userID)
VALUES(
    1,
    'How can I optimize website performance for mobile devices?',
    'Beginner',
    3
),
(
     2,
    'How can I handle data persistence in an Android/iOS app?',
	'Intermediate',
    2
    
),
(
     3,
    'How do you perform a penetration test on a network or application?',
	'Expert',
     4
),
(
     4,
    'What are the differences between IaaS, PaaS, and SaaS cloud service models?',
	'Intermediate',
    1
),
(
     5,
    'What are the advantages of test-driven development (TDD)?',
    'Beginner',
    5
);
    
insert into favorites
( userID,courseID, career_pathID )
VALUES
	(3, 2, 3  ),
	(1, 1,1 ),
    (4, 5, 2),
    (2, 5, 2);    
