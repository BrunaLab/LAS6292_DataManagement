## LAS 6262 Data Collection & Management 

This is the teaching materials and website for a course in data collection & management taught at the University of Florida. Because it was developed for students in two multidisciplinary graduate programs ([Latin American Studies](https://www.latam.ufl.edu/academics/graduate-programs/malas/) and [Tropical Conservation & Development](http://uftcd.org/)), it is ideal for students from a broad range of disciplines working with qualitative or quantitative data. It assumes no programming experience; students will learn how to use the R statistical programming language to correct data and organize it in tidy format. The approach to the course and its organization as a forkable repository is inspired by the [Data Carpentry for Biologists](https://github.com/datacarpentry/semester-biology) course developed, taught, and shared by [@ethanwhite](https://github.com/ethanwhite).

The course is designed to work primarily as a 'flipped' or 'active-learning' workshop, with students reading articles and viewing tutorial videos before coming to class. Class time is spent discussing the material and working on exercises with the teacher answering questions and demoing the concepts. The course remains under active development and I welcome contributions or suggestions to all aspects of the course and website. Suggestions for exercises, readings, examples, and exercises for the social sciences and humanities are especially welcome. You are also welcome to use course materials for your own course.  

### Organizational notes:

1. The course web page uses the [Wowchemy Online Course Template](https://github.com/wowchemy/starter-hugo-online-course) for Hugo. I edit the course using RStudio and Blogdown.
2. The image on the landing page image is stored in `assets`->`media`   
3. The top menu is edited in the menus.yaml file (`config`->`_default`) 
4. The home page is multiple widgets that are in `content`->`home`
5. The page is organized as a book, with each chapter (page) set up as a folder in `content`->`home`. 
6. Each week's reading assignment and in-class materials are set up as blog posts, with each week in a different folder (`content`->`post`). The 'correct' way might have been to set them up as child pages under `course content`, but that made the left-side menu too busy and I wanted a more streamlined page. 
7. Readings, assignment descriptions, the syllabus, and other pdf files meant to be downloaded -- along with the RMarkdown documents used to render them -- are grouped in folders in the `static` folder. (as per the template documentation).
8. Be sure to name files and folders with dashes, not underscores (e.g., `class-sessions`, not `class_sessions`).

### How to contribute to the course or suggest corrections 

1. With the standard GitHub flow: fork the repository, add or change material, and submit a pull request.
2. Send me an [email](mailto:embruna@ufl.edu).


### Up next:
1. As per the [README for EW's Carpentry course](https://github.com/datacarpentry/semester-biology), I will soon be reviewing all materials for accessibility and scanning new pull requests with pa11y and pa11y-ci to ensure that additions to the site follow accessibility best practices. If you discover any accessibility issues with the site please open an issue and I'll address them.

2) Add instructions (or at least links) for how to use this and Jekyll to build your own course website.

### Acknowledgements
This course was taught and developed with support from the UF Center for Latin American Studies and relies on the outstanding resources developed by [The Carpentries](https://carpentries.org/), the [Environmental Data Initiative](https://environmentaldatainitiative.org/), [DataONE](https://dataoneorg.github.io/Education/), and the courses taught by the [Weecology Group](https://www.weecology.org/). 

