function is_empty(s)
  return s == nil or s == ''
end

return {
  {
    Meta = function(meta)
      meta.pagefooter = pandoc.RawInline("latex", "\\DTMnow")
      if not is_empty(meta.flandersqmd.floatbarrier) then
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "section") then
          meta.floatbarriersection = true
        end
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "subsection") then
          meta.floatbarriersubsection = true
        end
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "subsubsection") then
          meta.floatbarriersubsubsection = true
        end
      end
      if not is_empty(meta.flandersqmd.cover) then
        meta.cover = pandoc.utils.stringify(meta.flandersqmd.cover)
      end
      return meta
    end
  }
}
