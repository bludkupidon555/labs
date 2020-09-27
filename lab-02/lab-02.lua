lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-02.glade')

ui = bld.objects

ui.MainForm.title = 'lab-02_473_Turubar_Prilipchanu'
ui.MainForm.on_destroy = gtk.main_quit
ui.MainForm:show_all()

function ui.AddB:on_clicked(...)
	if (type(tonumber(ui.NumberA.text))=='number' and type(tonumber(ui.NumberB.text))=='number')
	then 
		a=tonumber(ui.NumberA.text)
		b=tonumber(ui.NumberB.text)
		ui.ResultTB.label = a+b;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end
end

function ui.SubbtractB:on_clicked(...)
	if (type(tonumber(ui.NumberA.text))=='number' and type(tonumber(ui.NumberB.text))=='number')
	then 
		a=tonumber(ui.NumberA.text)
		b=tonumber(ui.NumberB.text)
		ui.ResultTB.label = a-b;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end
end

function ui.MultiplyB:on_clicked(...)
	if (type(tonumber(ui.NumberA.text))=='number' and type(tonumber(ui.NumberB.text))=='number')
	then 
		a=tonumber(ui.NumberA.text)
		b=tonumber(ui.NumberB.text)
		ui.ResultTB.label = a*b;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end
end

function ui.DivideB:on_clicked(...)
	if (type(tonumber(ui.NumberA.text))=='number' and type(tonumber(ui.NumberB.text))=='number')
	then 
		a=tonumber(ui.NumberA.text)
		b=tonumber(ui.NumberB.text)
		if(b==0)
		then
			ui.ResultTB.label = "x_X_x_Error_x_X_x";
		else
			ui.ResultTB.label = a/b;
		end
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end
end

function ui.sinB:on_clicked(...)

	if (type(tonumber(ui.NumberA.text))=='number')
	then 
		a=math.sin(math.rad(tonumber(ui.NumberA.text)));
		ui.ResultTB.label = a;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end

end

function ui.cosB:on_clicked(...)

	if (type(tonumber(ui.NumberA.text))=='number')
	then 
		a=math.cos(math.rad(tonumber(ui.NumberA.text)));
		ui.ResultTB.label = a;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end

end

function ui.tgB:on_clicked(...)

	if (type(tonumber(ui.NumberA.text))=='number')
	then 
		a=math.tan(math.rad(tonumber(ui.NumberA.text)));
		ui.ResultTB.label = a;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end

end

function ui.ctgB:on_clicked(...)

	if (type(tonumber(ui.NumberA.text))=='number')
	then 
		a=math.cos(math.rad(tonumber(ui.NumberA.text)))/math.sin(math.rad(tonumber(ui.NumberA.text)));
		ui.ResultTB.label = a;
	else
		ui.ResultTB.label = "x_X_x_Error_x_X_x";
	end

end

gtk.main()


	


