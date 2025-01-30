function sendDiscordEmbed(webhook, color, thumbnailUrl, title, description, fields)
  local data = toJSON(
    {
      embeds = {
        {
          color = color,
          title = title,
          description = description,
          fields = fields,
          thumbnail = {
            url = thumbnailUrl
          }
        }
      }
    }
  )

  data = data:sub(2, -2)
  local callback = {
    connectionAttempts = 5,
    connectTimeout = 7000,
    headers = { ["Content-Type"] = "application/json" },
    postData = data
  }

  fetchRemote(webhook, callback, function() end)
end

--Exemplo
addCommandHandler("teste", function(player)
  sendDiscordEmbed("https://discord.com/api/webhooks/1334571431425736768/6YVOA3dzeIO-eA4cwyEdyNc5eKAGaYF01NduQEaPJ9vOrNO-zhZ-cqqa1q25GO7_3osi", 0x8403fc, "https://down-br.img.susercontent.com/file/f144dbd2fb7917538bd2068729a0fcc9", "LOG", "teste", {
    { name = "Player", value = "```" .. player:getName() .. "```", inline = false },
    { name = "Teste 1", value = "```" .. "Hello, world" .. "```", inline = false },
    { name = "Teste 2", value = "```" .. "gfkiifdngndfuingiun dfingh dhn ndguihnu nugdh" .. "```", inline = false },
  })
end)