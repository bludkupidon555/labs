lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-02.glade')

ui = bld.objects

ui.MainForm.title = 'lab-02_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

gtk.main()

function ui.AddB:on_clicked(...)
	a=tonumber(ui.NumberA.text)
	b=tonumber(ui.NumberB.text)
	ui.ResultTB.label = a+b;
end
	


