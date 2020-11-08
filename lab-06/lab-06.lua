lgi = require 'lgi'
sqlite = require 'lsqlite3'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-06.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')
ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

ui.MainForm.title = 'lab-06_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

rdr_txt = gtk.CellRendererText {xalign=0.5}

emp1 = gtk.TreeViewColumn {title = 'Employee name', 	{rdr_txt, { text = 1 }}	}
emp1:set_alignment(0.5)
ui.employeeTree:append_column(emp1)

lang1 = gtk.TreeViewColumn {title = 'Programming language', 	{rdr_txt, { text = 1 }}	}
lang1:set_alignment(0.5)
ui.languageTree:append_column(lang1)


ui.DatabaseForm.title = 'Database Tables'
function ui.tablesB:on_clicked(...)
	ui.DatabaseForm:show_all()

	db = sqlite.open('lab-06.db')

	for row in db:nrows('SELECT *FROM emptable') do
		el = ui.employeeList:append()
		ui.employeeList[el] = {[1] = row.Name}
	end

	for row in db:nrows('SELECT *FROM langtable') do
		el = ui.languageList:append()
		ui.languageList[el] = {[1] = row.Language}
	end

	db:close()
end

function ui.closetablesB:on_clicked(...)
	ui.DatabaseForm:hide()
end



gtk.main()
