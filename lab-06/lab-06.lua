lgi = require 'lgi'
sqlit = require 'lsqlite3'

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

c1 = gtk.TreeViewColumn {title = 'Name', {rdr_text, { text = 1}}  }


db = sqlite.open('lab0-6.db')

for row in db:nrows('SELECT *FROM employeeList') do
	el = ui.employeeList:append()
	ui.employeeList[el] = {[1] = row.Name}
end

db.close()


ui.DatabaseForm.title = 'Database Tables'
function ui.tablesB:on_clicked(...)
	ui.DatabaseForm:show_all()
end

function ui.closetablesB:on_clicked(...)
	ui.DatabaseForm:hide()
end



gtk.main()
