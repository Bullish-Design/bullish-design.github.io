+++
title = "Siteman"
description = "A file-based Hugo site workflow delivered as a devenv module."
image = "images/siteman-build.svg"
image_alt = "Diagram of site content, configuration, and a rendered page."
preview = true
weight = 2
+++

Siteman is a static site workflow delivered as a devenv module. It provides a pinned Hugo Extended toolchain and commands to initialize, serve, build, and check a site.

## Design decisions

Site content stays in visible files. Hugo configuration and fallback layouts stay in .siteman/. This keeps the authored pages easy to edit while giving the build tools one consistent configuration.

Siteman supports a site theme before siteman-default. The chosen theme handles its own pages, while the fallback supplies layouts that the theme does not include. This site uses that order with Roxo Flex first.

## Bullish Design's role

Bullish Design publishes siteman as a reusable site tool. This site uses its commands to initialize, build, and check the Roxo Flex site. Read the [siteman repository](https://github.com/Bullish-Design/siteman) for its setup and command reference.
