# Zack's LaTeX Resume
This repository contains my "immutable" resume that I created using a modified open source XeTeX template.

For privacy reasons, some personal information is redacted. A full version is available upon request.

**[Click here for Resume](resume_cv.pdf)**

### Branch Information
- docker: This branch creates a XeTex Docker container leveraging a [Dockerfile](Dockerfile) to customize an Ubuntu 18.04 container with XeTex dependencies, as well as some handy packages. Upon success, GitLab CI will tag the container as latest.
- master: This is the primary branch that runs the pdf_compile job.

### Repository Links
- [GitHub Repository](https://github.com/zackhorvath/resume)

## ToDo
- Implement [TeXtidote](https://github.com/sylvainhalle/textidote) to perform syntax, spelling, and grammar validation. Will generate html reports as artifacts.
- Create TeX to HTML makefile to publish Resume to GitLab pages so it can be displayed inline. This avoids the weird PDF render issues that Google Chrome has.
- Create a test system for the docker pipeline to verify that xelatex works properly. This would run various smoke tests to ensure that `docker` branch runs do what they need to do.
- Move pdf compilation off master branch in a way that allows merging artifacts from a pdf-compile branch. This avoids the messy "commit back to master" job I have set up.

## FAQ
### How does this work?
Think of my [resume_cv.tex](resume_cv.tex) file as a lego set, which imports building blocks from other .tex files inside `cv-sections`. When I want to make an update to this, I can merely pull the latest version of this repository, edit the .tex blocks that I want to, and commit it back to GitLab. Once that's complete, GitLab will download a Docker container (which is maintained in the docker branch in this repository) preconfigured with XeTeX dependencies and will compile my PDF for me. Once that's done, it's both stored as an artifact AND committed back to the master branch.

### Why LaTeX?
I was crawling Reddit and came across another user who mentioned that they were having issues writing a technical document in LaTex. Intrigued, I looked for a good use case to experiment with it, and came across a sweet template that someone else had made. From there, I reverse engineered the styling documents to understand how the code worked, and modified it for my own uses.

### Why put this in CI/CD?
I wanted to put this online not only as an exercise for myself, but also for everyone to see, and hopefully learn from! This is especially great because I can make changes to this "code base" without needing to be on a computer that has TeX libraries, or Docker, installed.
