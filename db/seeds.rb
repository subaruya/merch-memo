# サンプル予約サイトを作成
 10.times do |pre_ordered_site|
  PreOrderedSite.create(name: "Example site#{pre_ordered_site}")
 end


 # サンプルアイテムを作成
pre_ordered_site_ids = PreOrderedSite.ids

25.times do |index|
  pre_ordered_site = PreOrderedSite.find(pre_ordered_site_ids.sample)
  pre_ordered_site.items.create!(name: "Sample Item#{index}",
                                pre_ordered_site_id: pre_ordered_site_ids)
end