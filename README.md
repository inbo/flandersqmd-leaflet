<!-- badges: start -->
![GitHub](https://img.shields.io/github/license/inbo/flandersqmd-leaflet)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/inbo/flandersqmd-leaflet/check-project)
![GitHub repo size](https://img.shields.io/github/repo-size/inbo/flandersqmd-leaflet)
<!-- badges: end -->

# Quarto extension providing the corporate identity of the Flemish government for leaflets

[Onkelinx, Thierry![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0001-8804-4216)[^aut][^cre][^INBO]
[Research Institute for Nature and Forest (INBO)](mailto:info%40inbo.be)[^cph][^fnd]

[^aut]: author
[^cph]: copyrightholder
[^cre]: contact person
[^fnd]: funder
[^INBO]: Research Institute for Nature and Forest (INBO)

**keywords**: flandersqmd; inbo_version

<!-- community: inbo -->
<!-- version: 0.0.1 -->

<!-- badges: start -->
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/inbo/checklist/check_project.yml)
![GitHub](https://img.shields.io/github/license/inbo/flandersqmd-book)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/inbo/flandersqmd-book/check-project)
![GitHub repo size](https://img.shields.io/github/repo-size/inbo/flandersqmd-book)
<!-- badges: end -->

<!-- community: inbo -->

<!-- description: start -->
This quarto extension builds on the quarto [book format](https://quarto.org/docs/books/) and provides the corporate identity of the Flemish government for leaflets.
A full example is available in the `source` folder in the [GitHub repo](https://github.com/inbo/flandersqmd-leaflet/).
Visit https://inbo.github.io/flandersqmd-leaflet/ to view the rendered version of the example.
<!-- description: end -->

## Installation

**1.** Start by setting up a quarto book project.
You can find more information on how to do this in the [quarto documentation](https://quarto.org/docs/books/).

**2.** Then open the terminal and go the root of your quarto book project.
Run the command below to install the quarto extension and confirm when prompted.
Once installed, you can optionally view the documentation in your browser.

```
quarto install extension inbo/flandersqmd-leaflet
```

**3.** Replace the `project:` section in your `_quarto.yml` file with the following code:

```
project:
  type: book
  preview:
    port: 4201
    browser: true
  render:
    - "*.md"
    - "*.qmd"
    - "!LICENSE.md" #ignore LICENSE.md
    - "!README.md" #ignore README.md
  output-dir: output
```

**4.** Replace the `format:` section in your `_quarto.yml` file with the following code:

```
format:
  flandersqmd-leaflet-pdf: default
```

**5.** Then specify the `flandersqmd:` section in the `_quarto.yml` file.
[Below](#flandersqmd-settings) is the full list of settings that can be used.

**6.** Update the settings in the `book:` section in the `_quarto.yml` file.
- Remove `title`, `author` and `date` information from the `book:` section.
- Update the `chapters:` subsection to include the chapters of your report.

**7.** Add `{{< colophon >}}` to the top of the `index.md` file to include the colophon.

## `flandersqmd` settings

### Required settings with default values

- `entity`: The entity that is publishing the report.
  Currently only `INBO` is supported.
  Defaults to `INBO` when omitted.
- `level`: The style guide level of the report.
  `1` refers to the global corporate identity of the Flemish government.
  `2` refers to the entity level corporate identity.
  Level `2` should only be used for reports in the Dutch language written by a single entity.
  Defaults to `1` when omitted.

### Required settings with no default

Missing settings are replaced by `!!! missing flandersqmd.settingname !!!` in the output.
And a `DRAFT` watermark will appear on every page.

- `title`: The title of the report.

### Mandatory settings to be set for the final version

- `cover`: The cover of the report for the pdf version.
  Path to a cover file.
  Should be a pdf file.
  Will use the first page of the pdf as the cover.
  The title and subtitle will be placed ontop of the cover.

### Optional settings

- `subtitle`: The subtitle of the report.

## Render your quarto report

You can render your quarto report in two main ways:

1. **Using RStudio's Build Pane**
   - Open your quarto book project in RStudio.
   - Click on the **Build** tab (usually found in the top-right panel).
   - Click **Render Book** to generate all formats.
     You can click on the down arrow next to the **Render Book** button to render only a specific format.
     If no `flandersqmd-leaflet` format is available, restart your quarto book project and try again.
   - The output format is saved to disk.

2. **Using the Terminal**
   - Open a terminal and navigate to the folder of your quarto book
   - Run the commands below in the terminal.
     This renders the book and saves it to disk like the **Render Book** button of the **Build** tab.
     Preview renders the book and starts a live preview, automatically updating the output when changes are detected.

```sh
# render all formats
quarto render
```

## Full example of the `_quarto.yml` file

```
project:
  type: book
  preview:
    port: 4201
    browser: true
  render:
    - "*.md"
    - "*.qmd"
    - "!LICENSE.md" #ignore LICENSE.md
    - "!README.md" #ignore README.md
  output-dir: output

execute:
  echo: false
  freeze: auto

lang: en-GB # nl-BE, fr-FR

bibliography: references.bib

format:
  flandersqmd-leaflet-pdf: default

flandersqmd:
  entity: INBO
  level: 2
  title: Title for the example website
  subtitle: The optional subtitle
  cover: media/cover.pdf

book:
  chapters:
    - index.md
```
