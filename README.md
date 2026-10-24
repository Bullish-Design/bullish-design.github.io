# Bullish Design website

This site uses Hugo Extended, siteman, and the Roxo Flex theme.

## Structure

- .siteman/hugo.toml sets the site title, root URL, menu, theme, and palette.
- content/_index.md holds the homepage sections.
- content/about/, content/portfolio/, and content/contact/ hold site pages.
- content/field-notes/ holds sourced product and design studies.
- static/images/ and static/icons/ hold site-owned artwork. The header uses a
  direct crop of the faceted logo. The homepage and footer use linework crops.
  The favicon uses the circular faceted logo.
- .siteman/layouts/contact.html adds the public GitHub contact link.

Roxo Flex loads before siteman-default. Keep that order so siteman can provide
fallback layouts. Hugo pins the resolved Roxo Flex version in go.mod and
go.sum.

## Edit content

Edit the Markdown files under content/. Set a useful title and description in
each page's front matter. Set image_alt when a page uses an image. Keep new
artwork in static/images/ and use links to cite research.

Change the palette, menu, logo, and root URL in .siteman/hugo.toml. Keep the
accent close to the sampled copper in the logo artwork. Do not redraw the
supplied logo assets. Do not set
params.contact.form_endpoint until a real form service exists. The contact
page uses a public GitHub issue link while no email address is available.

## Verify and publish

Run devenv shell -- siteman-serve, devenv shell -- siteman-build, and
devenv shell -- siteman-check. Run testee verify before publishing.

The Pages workflow checks and builds the site before deployment. `tools/siteman/`
contains the pinned Siteman module snapshot from source commit
`979efd30b98e5bd6c74b013d6fcca758dd907766`. The site repository commit pins
that snapshot, so GitHub Actions does not need a private Siteman token.
