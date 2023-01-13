# reference-project-documentation-generator
Use Pandoc, LaTeX, and LibreOffice to automatically generate pixel perfect project documentation

Model documentation is a formal collection of documents that provide explanation of the rationale, assumptions, derivations, tests, validation, and other analyses that justify the model's fitness for purpose. They are often mandated by various regulatory bodies and maintaining a comprehensive model documentation is essential for running a reliable and explainable data science-backed decision process. Model accompanying documentation often features (but is not limited to):
* What the model does and what is the justification and intended use-case
* Model inputs, training data, assumptions, parameters, algorithms, processing techniques, theoretical underpinnings of the model, what calculations are used etc.
* Validation and testing techniques
* Model outputs and interpretation
* Baseline performance and monitoring strategies

Ideally, model documentation is maintained in a format that is open, easy for automatic processing, and straightforward for versioning. One such format is Markdown, which is easy to parse, validate, and process in an automated fashion. On the other hand, using Markdown for model documentation can often be problematic, because businesses have sometimes established risk management practices that rely on proprietary format templates (e.g. Word documents, PDF files etc.)

One workflow that handles this situation well is via [Pandoc](http://pandoc.org/), a free framework for converting files from one markup format into another. Pandoc supports a wide range of file formats like Markdown and Wiki markup formats, LaTeX, Microsoft Word, RTS, LibreOffice ODT, PDF, Microsoft Powerpoint, various e-book standards and more.

In this project we demonstrate a workflow for producing pixel-perfect model documentation by merging markdown with a Microsoft Word template and applying the relevant styles and formatting to the resulting document.

## Prerequisites

This project uses standard python libraries and any base Domino image should work well. The last test was done on quay.io/domino/compute-environment-images:ubuntu20-py3.9-r4.2-domino5.3-standard

Dockerfile instructions used are below:

```
RUN sudo add-apt-repository -y ppa:libreoffice/ppa

RUN sudo apt-get update

RUN sudo apt-get install -y libreoffice

RUN echo 'libssl1.1 libraries/restart-without-asking boolean true' | sudo debconf-set-selections

RUN sudo apt-get install -y texlive-latex-extra
```

Plugable workshpace tools:

```
jupyter:
  title: "Jupyter (Python, R, Julia)"
  iconUrl: "/assets/images/workspace-logos/Jupyter.svg"
  start: [ "/opt/domino/workspaces/jupyter/start" ]
  supportedFileExtensions: [ ".ipynb" ]
  httpProxy:
    port: 8888
    rewrite: false
    internalPath: "/{{ownerUsername}}/{{projectName}}/{{sessionPathComponent}}/{{runId}}/{{#if pathToOpen}}tree/{{pathToOpen}}{{/if}}"
    requireSubdomain: false
jupyterlab:
  title: "JupyterLab"
  iconUrl: "/assets/images/workspace-logos/jupyterlab.svg"
  start: [  "/opt/domino/workspaces/jupyterlab/start" ]
  httpProxy:
    internalPath: "/{{ownerUsername}}/{{projectName}}/{{sessionPathComponent}}/{{runId}}/{{#if pathToOpen}}tree/{{pathToOpen}}{{/if}}"
    port: 8888
    rewrite: false
    requireSubdomain: false
vscode:
  title: "vscode"
  iconUrl: "/assets/images/workspace-logos/vscode.svg"
  start: [ "/opt/domino/workspaces/vscode/start" ]
  httpProxy:
    port: 8888
    requireSubdomain: false
rstudio:
  title: "RStudio"
  iconUrl: "/assets/images/workspace-logos/Rstudio.svg"
  start: [ "/opt/domino/workspaces/rstudio/start" ]
  httpProxy:
    port: 8888
    requireSubdomain: false
```
## Workflow

The model documentation workflow is implemented as follows:
* Model documentation is written and stored as part of the Domino project. It is considered best practice to use an open format that is easy for machine parsing and processing (e.g. Markdown, LaTex, plain text etc.)
* Pandoc is used to merge the model documentation and a reference template together and produce final documentation in a desired output format. The reference template contains corporate branding and styles that are applied to the raw (e.g. Markdown) documentation.
* The resulting file is stored either as part of the project or exported to an external document repository (e.g. a dedicated Model Risk Management solution)

