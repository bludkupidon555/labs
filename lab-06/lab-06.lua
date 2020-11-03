lgi = require 'lgi'

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


ui.DatabaseForm.title = 'Database Tables'
function ui.tablesB:on_clicked(...)
	ui.DatabaseForm:show_all()
end

function ui.closetablesB:on_clicked(...)
	ui.DatabaseForm:hide()
end



gtk.main()
