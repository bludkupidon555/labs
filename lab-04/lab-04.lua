lgi = require 'lgi'

gdk = lgi.Gdk

gtk = lgi.Gtk
picture = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-04.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')
ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.MainForm.title = 'lab-04_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

rdr_txt = gtk.CellRendererText {}
rdr_pix = gtk.CellRendererPixbuf {}

c1 = gtk.TreeViewColumn {title = 'Name',         {rdr_txt, {text = 1  }}	}	
c2 = gtk.TreeViewColumn {title = 'Count',        {rdr_txt, {text = 2  }}	}
c3 = gtk.TreeViewColumn {title = 'Price',        {rdr_txt, {text = 3  }}	}
c4 = gtk.TreeViewColumn {title = 'Total price',  {rdr_txt, {text = 4  }}	}
c5 = gtk.TreeViewColumn {title = 'Picture',      {rdr_pix, {text = 5  }}	}

ui.dataTree:append_column(c1)
ui.dataTree:append_column(c2)
ui.dataTree:append_column(c3)
ui.dataTree:append_column(c4)
ui.dataTree:append_column(c5)

rbArr={ui.rbApple, ui.rbBlueberry, ui.rbCherry, ui.rbGrapes, ui.rbLemon, ui.rbOrange, ui.rbPear, ui.rbRaspberry, ui.rbStrawberry}

function ui.addB:on_clicked(...) -- Нажатие на кнопку "Add"
	protectAddB() -- Функция выполняющая роль защиты от дурака; проверка на пустоту и корректность вводимых данных
	ui.stateL.label = 'State: OK!' -- Все зае**сь получаеца

	name = ui.nameTB.text
	count = tonumber(ui.countTB.text)
	price = tonumber(ui.priceTB.text)
	total = price * count
	picture =''
	
	for i = 1, 9, 1 do
		if(rbArr[i].active==true) then picture = rbArr[n].label end	
	end
	
	ui.stateL.label = picture

	px=pixbuf.new_from_file(picture)

	i = ui.dataList:append() 
	ui.dataList[i] = {[1] = name, [2] = count, [3] = price, [4] = total, [5] = px}
	
end

function protectAddB()
	if(protectName() == '') then 
	else 
		ui.stateL.label = 'State: '..protectName()
		return 
	end

	if(protectCount() == '') then 
	else 
		ui.stateL.label = 'State: '..protectCount()
		return 
	end
	
	if(protectPrice() == '') then 
	else 
		ui.stateL.label = 'State: '..protectPrice()
		return 
	end
end

function protectName()

	if (ui.nameTB.text == '') then return 'Field (Name) is empty'
	else
		return '' end
end

function protectCount()

	if (ui.countTB.text == '') then return 'Field (Count) is empty'
	elseif (type(tonumber(ui.countTB.text))~='number') then return 'Field (Count) is not correct'
	else 
		return '' end
end

function protectPrice()

	if (ui.priceTB.text == '') then return 'Field (Price) is empty'
	elseif (type(tonumber(ui.priceTB.text))~='number') then return 'Field (Price) is not correct'
	else 
		return '' end
end

gtk.main()
