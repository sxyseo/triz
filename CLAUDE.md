# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Quarto-based educational website for teaching TRIZ (Theory of Inventive Problem Solving), a Russian system for structured, creative problem-solving. The site is built as a scientific publishing platform with interactive modules, case studies, and teaching materials.

## Development Commands

### Core Quarto Commands
- `quarto preview` - Start development server (default: http://localhost:4200)
- `quarto render` - Build the entire site for production
- `quarto render <path/to/file.qmd>` - Render a specific file

### R Code Execution
- Uses R/knitr for executing code chunks in .qmd files
- Code execution settings in `_quarto.yml`: freeze: auto, cache: true
- Code chunks configured with `opts_chunk: tidy: 'styler'`

### Deployment
- `quarto publish` - Publish to configured service (Netlify via `_publish.yml`)
- Currently deployed to: https://teaching-triz.netlify.app

## Architecture Overview

### Content Structure

The site uses a hierarchical module-based learning system:

```
content/
├── Basics/              # Basic creativity concepts
│   └── Modules/         # 7 modules (Flow, Cultural Capital, MBTI, etc.)
├── TRIZ/                # Core TRIZ curriculum
│   └── Modules/         # 19 modules numbered 60-7777
└── projects/            # Case studies and talks
    └── Modules/
        ├── TRIZ/        # 5 case studies
        └── Talks/       # Presentation recordings
```

### Module Organization Pattern

Each module follows this structure:
- `index.qmd` - Main content file with frontmatter
- `featured.jpg` - Social sharing image
- Additional assets (images, diagrams, etc.)

**Frontmatter Structure:**
```yaml
title: "Module Title"
date: "YYYY-MM-DD"
date-modified: "`r Sys.Date()`"
order: <number>           # Determines sidebar order
image: featured.jpg
tags: [tag1, tag2, ...]
filters:
  - social-share
share:
  permalink: "https://teaching-triz.netlify.app/..."
  description: "Module description"
  twitter, facebook, linkedin, etc.: true
```

### Configuration Architecture

**`_quarto.yml`** - Main configuration file controls:
- Website settings (navigation, search, SEO)
- Sidebar structure and hierarchy
- Extension filters (d2, tabby, webr, shinylive, mermaid, line-highlight)
- Theme customization (united theme)
- Grid system (sidebar-width: 250px, body-width: 1000px, margin-width: 250px)
- Code execution and display settings
- Social media integration (GitHub, Twitter, LinkedIn)

**`_publish.yml`** - Deployment configuration for Netlify

### Extension System

The project uses 37+ Quarto extensions in `_extensions/` directory:
- **social-share** - Social media sharing functionality
- **lightbox** - Image lightbox overlay
- **tabby** - Interactive tabbed content
- **shinylive** - Interactive Shiny apps
- **webr** - Web-based R execution
- **d2** - Diagram-as-code visualization
- **mermaid** - Flowchart and diagram generation
- **line-highlight** - Code line highlighting
- **tachyons** - CSS utility classes (causes issues with decimal wrapping)

### Content Creation Patterns

**Module Numbering System:**
- Basics: 10-70 (increments of 10)
- TRIZ Core: 60-200 (hierarchical: 60, 70, 75, 80, 90, 95, 100, 200, 400)
- Special: 1000 (Games), 7777 (Writing Assignments)

**Code Chunk Patterns:**
- R code chunks use knitr syntax: ```` ```{r, options} ````
- Common options: `echo=FALSE`, `fig.align='center'`, `out.height/width`
- Image inclusion: `knitr::include_graphics("path/to/image")`
- Setup chunks typically load: `library(blogdown)`, `library(hugodown)`

**Content Features:**
- Featured images for social sharing
- Embedded diagrams (D2, Mermaid)
- Interactive R code execution with webr
- Tabbed content for multiple versions
- Lightbox for image galleries
- Social sharing buttons (Twitter, Facebook, LinkedIn, Reddit, Mastodon, Bluesky)

## Adding New Content

### Creating a New Module

1. Create directory in appropriate section:
   - Basics: `content/Basics/Modules/<ORDER>-Module-Name/`
   - TRIZ: `content/TRIZ/Modules/<ORDER>-TRIZ-Topic/`
   - Projects: `content/projects/Modules/<TYPE>/<ORDER>-Project-Name/`

2. Add `index.qmd` with proper frontmatter (include order, tags, share settings)

3. Add `featured.jpg` for social sharing preview

4. Update `_quarto.yml` sidebar contents to include new module

### Adding Assets

- Images: Place in module directory or `content/materials/images/`
- Diagrams: Use D2 or Mermaid syntax directly in .qmd
- Custom CSS: Add to `css/` directory and reference in `_quarto.yml`

## Important File Locations

- `_quarto.yml` - Main configuration (sidebar, extensions, theme)
- `_publish.yml` - Netlify deployment settings
- `index.qmd` - Homepage with personal introduction
- `content/materials/` - Shared teaching materials and images
- `css/` - Custom stylesheets
- `_extensions/` - Quarto extensions (do not modify manually)
- `_freeze/` - Cached code execution results
- `_site/` - Generated output (gitignored)

## Special Considerations

### Code Execution
- Set `freeze: auto` in `_quarto.yml` to cache code results
- Use `cache: true` for expensive computations
- Set `error: true` allows rendering to continue despite errors
- Code chunks support R (via knitr) and can be extended to other languages

### Social Sharing
- Each module should have `featured.jpg` for optimal sharing
- Configure share platforms in frontmatter
- Permalinks should follow the pattern: `https://teaching-triz.netlify.app/content/<section>/modules/<module-name>/`

### Diagram Formats
- **D2**: Declarative diagramming (configured for SVG output)
- **Mermaid**: Flowcharts, sequence diagrams (theme: forest)
- Both can be embedded directly in markdown

### Deployment
- Primary target: Netlify (configured in `_publish.yml`)
- Build process: Quarto static site generation to `_site/`
- Domain: teaching-triz.netlify.app
- Repository: https://github.com/arvindvenkatadri/teachingtriz

## Theme and Styling

- Base theme: **united** (Bootstrap-based)
- Custom fonts available in `fonts/` and `css/` (currently commented out)
- Font options: Roboto Condensed, Fira Code, Vollkorn, Playfair Display, etc.
- Mainfont and monofont can be set in `_quarto.yml` format section
- Custom CSS files can be added to the `css:` array

## Navigation Structure

- **Docked sidebar** (left) with collapsible sections
- **Navbar** (right) with social links
- **Breadcrumbs** enabled for navigation
- **Back-to-top** button enabled
- **Search** functionality built-in
- Collapse level: 2 (sections nested 2 deep)

## Related Teaching Websites

The author maintains multiple teaching websites on different topics:
- TRIZ for Problem Solvers (this site)
- The Mad Hatter's Guide to Data Viz and Stats in R
- Model Thinking in Design
- Literary Jukebox: Design Thinking from Short Fiction
- Maths for Creative Coders
- Intro to Design of Experiments in R
