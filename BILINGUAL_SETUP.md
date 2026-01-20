# Bilingual Website Setup

This document describes the bilingual structure implemented for the TRIZ tutorial website.

## Overview

The website now supports both English and Chinese languages with a clear separation of content.

## Directory Structure

```
content/
├── en/              # English content
│   ├── Basics/      # English basics modules
│   ├── TRIZ/        # English TRIZ modules
│   ├── projects/    # English case studies and talks
│   ├── index.qmd    # English homepage
│   └── listing.qmd  # English listing page
├── zh/              # Chinese content
│   ├── Basics/      # Chinese basics modules
│   ├── TRIZ/        # Chinese TRIZ modules
│   ├── projects/    # Chinese case studies and talks
│   ├── index.qmd    # Chinese homepage
│   └── listing.qmd  # Chinese listing page
└── materials/       # Shared resources (images, etc.)
```

## Language Switching

Users can switch between languages using:
1. **Navigation bar**: Language links in the top-right corner
2. **Sidebar**: English and Chinese sections are clearly separated
3. **Homepage**: Language selection page with automatic detection

## Configuration

The `_quarto.yml` file has been updated to:
- Include both English and Chinese content in the sidebar
- Provide language switching links in the navigation
- Support bilingual metadata and descriptions

## Usage

### Building the site
```bash
quarto render
```

### Previewing
```bash
quarto preview
```

## Language-Specific Content

Each language has its own complete set of content files:
- Module files in `content/en/` or `content/zh/`
- Image paths are relative (images remain in `content/materials/`)
- Frontmatter and metadata are language-specific

## Next Steps

1. Test the build process
2. Verify all links work correctly
3. Check that images load properly from shared materials directory
4. Test language switching functionality
5. Deploy to Netlify

## Notes

- The original Chinese content has been moved to `content/zh/`
- The English content has been restored from commit 2da1ffb to `content/en/`
- A backup branch `english-backup` was created for reference
- Shared resources (images, materials) remain in `content/materials/`
- Cache directories have been preserved for both languages
