function is_empty(s)
  return s == nil or s == ''
end

function translation_entity(result, lang, entity)
  if (entity == "INBO") then
    result.titlelogo = "inbo-logo.pdf"
    if (lang == "nl-BE") then
      result.tagline = "vlaanderen-wetenschap.pdf"
      result.url = "https://www.vlaanderen.be/inbo"
      result.url_text = "vlaanderen.be/inbo"
    elseif (lang == "fr-FR") then
      result.tagline = "flanders-state-art.pdf"
      result.url = "https://www.vlaanderen.be/inbo/en-gb/homepage/"
      result.url_text = "vlaanderen.be/inbo"
    else
      result.tagline = "flanders-state-art.pdf"
      result.url = "https://www.vlaanderen.be/inbo/en-gb/homepage/"
      result.url_text = "vlaanderen.be/inbo"
    end
  else
    result.tagline = "flanders-state-art.pdf"
    result.url = ''
    result.url_text = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
  end
  return result
end

function translation(lang, entity)
  local result
  result = {
  }
  return translation_entity(result, lang, entity)
end

return {
  {
    Meta = function(meta)
      if is_empty(meta.flandersqmd.entity) then
        meta.translation = translation(
          pandoc.utils.stringify(meta.lang), "INBO"
        )
      else
        meta.translation = translation(
          pandoc.utils.stringify(meta.lang),
          pandoc.utils.stringify(meta.flandersqmd.entity)
        )
      end
      if pandoc.utils.stringify(meta.lang) ~= 'nl-BE' or is_empty(meta.flandersqmd.level) or tonumber(pandoc.utils.stringify(meta.flandersqmd.level)) < 2 then
        meta.entitycolours = 'flanders'
      else
        meta.titlelogo = meta.translation.titlelogo
        if is_empty(meta.flandersqmd.entity) then
          meta.entitycolours = 'inbo'
        else
          meta.entitycolours = pandoc.text.lower(pandoc.utils.stringify(meta.flandersqmd.entity))
        end
      end
      return meta
    end
  }
}
