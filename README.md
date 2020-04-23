# Zack Horvath's Résumé
## Welcome!
This repository contains my Résumé - written and compiled in [LaTex](https://www.latex-project.org/), and published to this GitHub repo via a [GitLab pipeline](https://gitlab.com/zackhorvath/resume)!

What began as a fun proof-of-concept has become a super nerdy way to distribute my résumé! I modified the open souce [awesome-cv](https://github.com/posquit0/Awesome-CV) with some stylistic changes, and have built a pipeline that allows me to compile this LaTeX document from any computer without needing to rely on a third party service!

For privacy reasons, some personal information is redacted. A full version is available upon request.

**[Click Here To View My Resume!](resume_cv.pdf)**

---

## Technical Information

This repo is split into two separate 'feature' branches that allows me to target specific functionality with a commit. The desired functionality is defined by the [.gitlab-ci.yml](.gitlab-ci.yml), which creates multiple *stages* that are executed, in order, when code is commited to the repository. Since the end requirements are pretty menial, there are only three *stages* that needed to be defined:

- **docker_build:**  
When a commit is detected to the `docker` branch, GitLab logs into the GitLab Docker registry using [secure CI/CD environment variables](https://docs.gitlab.com/ee/ci/variables/), from there, an image is built in the GitLab runner, and pushed to the registry.
- **docker_release:**  
Also on the `docker` branch, after `docker_build` has been completed the runner then pulls the container image that was just built and tags it as the `CONTAINER_RELEASE_IMAGE`. This later becomes our `latest` image.
- **pdf_compile:**  
This stage only runs on `master` branch commits. It utilizes the `latest` image pushed in the last job, and runs a series of `xelatex` commands to compile our code. Due to a bug in how artifacts are handled with GitLab, I then need to re-commit the code back to Git - fortunately this is handled automatically, and skips the CI process by including the `[skip-ci]` block in the commit message.

---

## More Info
### How does this work?
Think of my [resume_cv.tex](resume_cv.tex) file as a lego set, which imports building blocks from other .tex files inside `cv-sections`. When I want to make an update to this, I can merely pull the latest version of this repository, edit the .tex blocks that I want to, and commit it back to GitLab. Once that's complete, GitLab will download a Docker container (which is maintained in the docker branch in this repository) preconfigured with XeTeX dependencies and will compile my PDF for me. Once that's done, it's both stored as an artifact AND committed back to the master branch.

### Why LaTeX?
I was crawling Reddit and came across another user who mentioned that they were having issues writing a technical document in LaTex. Intrigued, I looked for a good use case to experiment with it, and came across a sweet template that someone else had made. From there, I reverse engineered the styling documents to understand how the code worked, and modified it for my own uses.

### Why put this in CI/CD?
I wanted to put this online not only as an exercise for myself, but also for everyone to see, and hopefully learn from! This is especially great because I can make changes to this "code base" without needing to be on a computer that has TeX libraries, or Docker, installed.

## ToDo
- Implement [TeXtidote](https://github.com/sylvainhalle/textidote) to perform syntax, spelling, and grammar validation. Will generate html reports as artifacts.
- Create TeX to HTML makefile to publish Resume to GitLab pages so it can be displayed inline. This avoids the weird PDF render issues that Google Chrome has.
- Create a test system for the docker pipeline to verify that xelatex works properly. This would run various smoke tests to ensure that `docker` branch runs do what they need to do.
- Move pdf compilation off master branch in a way that allows merging artifacts from a pdf-compile branch. This avoids the messy "commit back to master" job I have set up.