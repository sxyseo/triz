-- SEO Metadata Extension for Quarto
-- Adds JSON-LD structured data to TRIZ teaching website

function addJsonLdData()
  -- JSON-LD structured data for the educational website
  local jsonLd = [[
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "EducationalOrganization",
  "name": "TRIZ Teaching Website",
  "url": "https://teaching-triz.netlify.app",
  "logo": "https://teaching-triz.netlify.app/content/materials/icon-park-twotone--concept-sharing.svg",
  "description": "学习TRIZ（发明问题解决理论）- 来自俄罗斯的结构化创新方法。掌握40个发明原理、矛盾矩阵、ARIZ等核心工具。",
  "founder": {
    "@type": "Person",
    "name": "Arvind Venkatadri",
    "jobTitle": "外部教师",
    "affiliation": "Srishti Manipal Institute of Art, Design and Technology",
    "url": "https://www.linkedin.com/in/arvindvenkatadri"
  },
  "sameAs": [
    "https://github.com/arvindvenkatadri/teachingtriz",
    "https://twitter.com/arvind_v"
  ],
  "educationalLevel": "Beginner to Advanced",
  "teaches": [
    "TRIZ Theory",
    "40 Inventive Principles",
    "Contradiction Matrix",
    "ARIZ",
    "Su-Field Analysis",
    "Creative Problem Solving"
  ],
  "keywords": "TRIZ,发明问题解决理论,创造性思维,创新方法,40个发明原理,矛盾矩阵",
  "inLanguage": "zh-CN",
  "license": "https://creativecommons.org/licenses/by-sa/2.0/"
}
</script>
]]
  return jsonLd
end

-- Add JSON-LD to head
function addToHeader()
  return addJsonLdData()
end

-- Return the quarto extension
return {
  {
    Meta = function(meta)
      meta.json_ld = addJsonLdData()
      return meta
    end
  }
}
