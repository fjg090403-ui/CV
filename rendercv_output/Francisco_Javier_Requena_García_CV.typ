
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Francisco Javier Requena García"
#let locale-catalog-page-numbering-style = context { "Francisco Javier Requena García - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in June 2026"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-partial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-small-caps-for-name = false
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-nested-bullet = "-"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-nested-bullet,
  spacing: design-highlights-vertical-space-between-highlights,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let bullet-entry(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: 0pt,
    indent: 0pt,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #if design-header-small-caps-for-name [
    #smallcaps(it.body)
  ] else [
    #it.body
  ]
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-partial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Francisco Javier Requena García

// Print connections:
#let connections-list = (
  [#box(original-link("mailto:fjg090403@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)fjg090403\@gmail.com])],
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Jaén, Andalucía, España],
  [#box(original-link("tel:+34-626-33-20-12")[#fa-icon("phone", size: 0.9em) #h(0.05cm)626 33 20 12])],
  [#box(original-link("https://franrequena-portfolio.vercel.app/")[#fa-icon("link", size: 0.9em) #h(0.05cm)franrequena-portfolio.vercel.app])],
  [#box(original-link("https://github.com/fjg090403-ui")[#fa-icon("github", size: 0.9em) #h(0.05cm)fjg090403-ui])],
  [#box(original-link("https://linkedin.com/in/fran-requena-282ab133b")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)fran-requena-282ab133b])],
)
#connections(connections-list)



== Perfil Profesional
#block(
  [


#one-col-entry(
  content: [#strong[Perfil:] Perfil orientado a Ingeniería de IA, análisis de datos y desarrollo Full-Stack, con experiencia práctica en RAG, agentes de IA, Machine Learning, Visión por Computador y automatización de flujos de desarrollo. Base sólida en backend, arquitectura de software, APIs, DevOps, CI\/CD y construcción de soluciones web completas basadas en datos]
)

  ],
  breakable: false,
  inset: (
    left: 0cm,
    right: 0cm,
  ),
  width: 100%,
)

== Inteligencia Artificial Aplicada
#block(
  [


#one-col-entry(
  content: [#strong[Sector de trabajo con IA:] Desarrollo Full-Stack con Inteligencia Artificial aplicada, automatización de procesos, agentes de IA, DevOps, CI\/CD y creación de productos digitales orientados a negocio]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Agentes y subagentes:] Uso de Codex, Claude Code, agentes y subagentes para analizar requisitos, dividir tareas complejas, generar código, revisar cambios, detectar errores y documentar decisiones técnicas con revisión humana]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Herramientas y técnicas:] Context engineering, prompt engineering, prompt chaining, prompt caching, loop engineering, desarrollo iterativo asistido por IA, revisión de código, depuración guiada, análisis de arquitectura y automatización de tareas repetitivas]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[GitHub, automatización y CI\/CD:] GitHub automatizado con Codex y Claude Code para ramas, commits, revisión, documentación, trazabilidad y asistencia en flujos de desarrollo. Conocimiento de pipelines CI\/CD, GitHub Actions, Docker, validación automática, construcción y despliegue continuo]
)

  ],
  breakable: false,
  inset: (
    left: 0cm,
    right: 0cm,
  ),
  width: 100%,
)

== Skills
#block(
  [


#one-col-entry(
  content: [#strong[Backend:] Java, Spring Boot, C, PHP, Symfony, Python, FastAPI, APIs REST, MVC, JWT, PostgreSQL, MongoDB]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Frontend:] React, Next.js, TypeScript, HTML5, CSS3, Sass, SCSS, Bootstrap, Tailwind, diseño responsive]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[IA y Data Science:] LangChain, RAG, ChromaDB, Ollama, KNIME, Kafka, Python, Pandas, NumPy, Scikit-learn, TensorFlow, Keras]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[IA aplicada y agentes:] Codex, Claude Code, agentes de IA, subagentes, context engineering, prompt engineering, prompt chaining, prompt caching, loop engineering, revisión asistida de código y automatización]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Visión por Computador:] MediaPipe, OpenCV, análisis en tiempo real, detección de movimiento]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[DevOps y CI\/CD:] Docker, Docker Compose, GitHub, GitHub Actions, pipelines CI\/CD, automatización de repositorios, control de versiones, integración continua y despliegue continuo]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Desarrollo móvil:] Flutter, Dart, aplicaciones multiplataforma Android\/iOS]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Herramientas:] Git, GitHub, Codex, Claude Code, WordPress, Socket.IO, Mercure, VS Code, despliegue de aplicaciones]
)

  ],
  breakable: false,
  inset: (
    left: 0cm,
    right: 0cm,
  ),
  width: 100%,
)

== Especialización Técnica
#block(
  [


#one-col-entry(
  content: [#strong[Ingeniería de IA aplicada:] RAG, agentes de IA, automatización con Codex\/Claude Code, integración de modelos y flujos human-in-the-loop]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Datos y Machine Learning:] Análisis de datos, preparación de datasets, entrenamiento, evaluación de modelos y visualización de resultados]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Arquitectura Full-Stack y DevOps:] APIs, autenticación JWT, roles, bases de datos, Docker, CI\/CD, despliegue y documentación técnica]
)

  ],
  breakable: false,
  inset: (
    left: 0cm,
    right: 0cm,
  ),
  width: 100%,
)

== Proyectos
#block(
  [


#one-col-entry(
  content: [#strong[SupportAI SaaS – Chatbot RAG multi-tenant \/ 2026:] SaaS de atención al cliente con IA generativa y RAG sobre documentos de empresa. Backend en Python con FastAPI, SQLAlchemy y JWT; LangChain para PDF\/TXT, ChromaDB por tenant, Ollama, PostgreSQL y frontend React\/TypeScript con Docker Compose]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Visión por computador en tiempo real \/ Diciembre 2025 - Marzo 2026:] Aplicación de escritorio en Python con OpenCV, MediaPipe, NumPy y PySide6. Se aplicó visión por computador para detección de pose, tracking, bounding boxes, esqueleto corporal y mapas de calor]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Machine Learning en múltiples datasets \/ 2024 - 2025:] Proyectos en Python con Pandas, NumPy, Scikit-learn, TensorFlow y Keras para limpieza, entrenamiento, clasificación, predicción y evaluación de métricas]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[GastroPro – Plataforma operativa para restaurantes \/ 2026:] Plataforma full-stack para carta QR, comandas en vivo, cocina\/sala, caja, reservas y analítica. PHP\/Symfony API Platform, PostgreSQL, Doctrine, JWT, roles, Next.js\/React PWA, Mercure y Docker Compose]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[SaaS Project Manager – Monorepo tipo Trello\/Jira \/ 2026:] SaaS de gestión de proyectos con Java 21\/Spring Boot, Spring Security, JWT, PostgreSQL, React\/Vite, Angular admin, Node.js\/Socket.IO, Kanban realtime y Docker Compose]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Plataforma de gestión de eventos \(Symfony\) \/ Enero 2024 - Junio 2024:] Aplicación web en PHP\/Symfony con Doctrine, Twig y MySQL\/PostgreSQL. Autenticación, roles, usuarios, eventos, inscripciones, panel admin, correos y generación de PDFs]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Organizador académico y financiero móvil \/ 2026:] App móvil en TypeScript con Expo, React Native, SQLite offline, Zustand y notificaciones locales para tareas, asignaturas, calendario, compras y gastos]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Portfolio web interactivo \/ 2026:] Portfolio personal con React, TypeScript, Vite, Tailwind CSS, Motion, Three.js y despliegue en Vercel]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Experiencia Kit Digital \/ 2024 - 2025:] Sitios web para clientes con WordPress, contenidos, SEO básico, formularios, responsive y hosting. https:\/\/lamochacasarural.com\/ | https:\/\/prodebor.es]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Aplicación móvil “La Mocha” y AEPA web corporativa \/ 2024 - 2025:] App turística en Flutter\/Dart y web corporativa con gestión de contenido e integración Google Drive. https:\/\/lamochacasarural.com\/app]
)

  ],
  breakable: false,
  inset: (
    left: 0cm,
    right: 0cm,
  ),
  width: 100%,
)

== Experiencia Profesional
#block(
  [


#one-col-entry(
  content: [#strong[Desarrollador Full-Stack Multiplataforma – THE SUPER DRIVER IOT SOLUTIONS SL:] Contrato de prácticas en Kit Digital: análisis de requisitos, arquitectura, bases de datos, desarrollo, despliegue, documentación, formación y soporte. Soluciones web, móviles y escritorio con PHP\/Symfony, Flutter\/Dart y Python, APIs y servicios externos para el sector turístico]
)

  ],
  breakable: false,
  inset: (
    left: 0cm,
    right: 0cm,
  ),
  width: 100%,
)

== Formación
#block(
  [


#one-col-entry(
  content: [#strong[Especialización en Inteligencia Artificial y Big Data \(IES Oretania\):] Machine Learning, Deep Learning, análisis de datos, Big Data, KNIME, Kafka, TensorFlow, PyTorch, Spark, Hadoop y Power BI]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[DAW – Desarrollo de Aplicaciones Web \(IES Oretania\):] Desarrollo full-stack con PHP, Symfony, HTML, CSS, JavaScript, bases de datos, APIs REST, roles y PDFs]
)

  ],
  breakable: false,
  inset: (
    left: 0cm,
    right: 0cm,
  ),
  width: 100%,
)

== Certificaciones
#block(
  [


#one-col-entry(
  content: [#strong[Certificaciones y conocimientos:] PCEP™ Python Institute, Desarrollo con IA - Programa con Agentes \(BIG school\/mouredev\), Sass y MongoDB \(OpenWebinars\), Inglés B2 \(Trinity College London\), AWS Cloud y SCSS avanzado]
)

  ],
  breakable: false,
  inset: (
    left: 0cm,
    right: 0cm,
  ),
  width: 100%,
)

