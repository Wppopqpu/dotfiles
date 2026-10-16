-- Retain the MediaWiki article body and discard the offline site's navigation shell.
local function find_article_body(blocks)
  for _, block in ipairs(blocks) do
    if block.t == "Div" then
      if block.identifier == "mw-content-text" then
        return block.content
      end

      local nested = find_article_body(block.content)
      if nested then
        return nested
      end
    end
  end
end

function Pandoc(document)
  local article_body = find_article_body(document.blocks)
  if article_body then
    return pandoc.Pandoc(article_body, document.meta)
  end

  return document
end
