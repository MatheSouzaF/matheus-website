# Copilot Instructions for matheus-website

## Visão Geral
Este projeto é um site pessoal construído com React, Vite e TailwindCSS. O código está organizado em componentes dentro de `src/components`. O estilo é feito tanto com Tailwind quanto com CSS customizado em `App.css`.

## Estrutura Principal
- `src/App.jsx`: Ponto de entrada do app, renderiza `Header` e `Banner`.
- `src/components/Header.jsx`: Header responsivo com menu mobile animado via classe CSS (`sidebar--open`).
- `src/components/Banner.jsx`: Banner principal com textos e estilos customizados.
- `src/App.css`: Estilos globais e animações customizadas (ex: menu mobile, links).

## Convenções e Padrões
- Para animações e transições, use classes CSS customizadas (ex: `.sidebar--open` para abrir o menu mobile).
- Classes arbitrárias do Tailwind são permitidas (ex: `max-w-[90%]`).
- O menu mobile não é controlado por display/block, mas sim por alternância de classe (`sidebar--open`).
- Links do header usam a classe `link-button` para animação de underline.
- O projeto utiliza apenas React (sem TypeScript).

## Workflows de Desenvolvimento
- Para rodar localmente: `npm run dev`
- Para build: `npm run build`
- Para preview do build: `npm run preview`
- Para lint: `npm run lint`
- O Vite faz HMR automaticamente.

## Integrações e Dependências
- `lucide-react` para ícones SVG.
- TailwindCSS configurado em `tailwind.config.js`.
- ESLint e Prettier configurados para padronização de código.

## Exemplos de Padrões
- Sidebar mobile:
  ```jsx
  <div className={"sidebar" + (open ? " sidebar--open" : "")}>...</div>
  ```
- Link animado:
  ```jsx
  <a className="link-button">Sobre</a>
  ```
- Tailwind custom:
  ```jsx
  <h1 className="max-w-[90%] text-5xl">...</h1>
  ```

## Arquivos Importantes
- `src/components/Header.jsx`, `src/components/Banner.jsx`, `src/App.css`, `tailwind.config.js`, `vite.config.js`, `package.json`

## Observações
- Evite manipular display/block do sidebar via React, use apenas alternância de classe.
- Siga os exemplos de animação e responsividade já presentes.
- Para novos componentes, siga o padrão de import/export e organização em `src/components`.

---

Seções pouco claras ou incompletas? Peça feedback para ajustar as instruções conforme necessário.
