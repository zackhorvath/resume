# Resume
This repository contains my "immutable" resume that I created using a modified open source XeTeX template. For privacy reasons, some personal information is redacted. A full version is available upon request.

[![pipeline status](https://gitlab.com/zackhorvath/resume/badges/master/pipeline.svg)](https://gitlab.com/zackhorvath/resume/commits/master)

[Resume Download](resume_cv.pdf)

### Repository Links
- [GitHub Repository](https://github.com/zackhorvath/resume)
- [GitLab Repository](https://gitlab.com/zackhorvath/resume)

## ToDo
- Create TeX to HTML makefile to publish Resume to GitLab pages so it can be displayed inline.

## FAQ
### How does this work?
Code is uploaded to GitLab where it is run through a CI process that launches a LaTeX docker container that compiles my resume and generates a PDF!

### Why LaTeX?
I got bored one day and someone on Reddit mentioned that they were having issues writing their PostDoc in LaTex. Intrigued, I looked for a good use case to experiment with it, and came across a sweet template that someone else had made. From there, I reverse engineered the styling documents to understand how the code worked, and modified it for my own uses.

### Why put this in CI/CD?
I wanted to put this online for everyone to see so hopefully someone else can learn from this exercise. LaTeX requires a compiler to generate a PDF version of your resume, and after dealing with weird TexWorks issues on Windows, I ended up using a Docker container for running the miktex compiler.
