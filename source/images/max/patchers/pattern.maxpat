{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 61.0, 438.0, 734.0, 492.0 ],
		"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
		"editing_bgcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 0,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "velvet",
		"subpatcher_template" : "noTB_dark",
		"boxes" : [ 			{
				"box" : 				{
					"color" : [ 0.490196, 0.498039, 0.517647, 1.0 ],
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 66.0, 328.0, 273.0, 22.0 ],
					"style" : "",
					"text" : "ossia.parameter my_spat.{1..5}/source.{1..3}/gain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 66.0, 260.0, 349.0, 20.0 ],
					"style" : "",
					"text" : "will match the parameters from both of those parameter groups:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 71.0, 191.0, 174.0, 20.0 ],
					"style" : "",
					"text" : "this more complex expresson: "
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.490196, 0.498039, 0.517647, 1.0 ],
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 66.0, 290.0, 283.0, 22.0 ],
					"style" : "",
					"text" : "ossia.parameter my_spit.[a-c]/source{.{1..3}\\,d}/gain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 66.0, 92.0, 256.0, 20.0 ],
					"style" : "",
					"text" : "will match some of the parameters created by:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 66.0, 53.0, 150.0, 20.0 ],
					"style" : "",
					"text" : "this: "
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.490196, 0.498039, 0.517647, 1.0 ],
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 86.0, 126.0, 273.0, 22.0 ],
					"style" : "",
					"text" : "ossia.parameter my_spat.{1..5}/source.{1..3}/gain"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 103.0, 53.0, 256.0, 22.0 ],
					"style" : "",
					"text" : "ossia.remote my_spat.{2..3}/source.{1..3}/gain"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 66.0, 223.0, 261.0, 22.0 ],
					"style" : "",
					"text" : "ossia.remote my_sp{a\\,i}t.[1-3a-c]/source*/gain"
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [ 			{
				"name" : "ossia.remote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ossia.parameter.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "Jamoma_highlighted_orange",
				"default" : 				{
					"accentcolor" : [ 1.0, 0.5, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ],
		"bgfillcolor_type" : "gradient",
		"bgfillcolor_color1" : [ 0.238168, 0.193585, 0.215291, 1.0 ],
		"bgfillcolor_color2" : [ 0.117536, 0.116592, 0.144338, 1.0 ],
		"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_angle" : 270.0,
		"bgfillcolor_proportion" : 0.39,
		"bgfillcolor_pt1" : [ 0.504951, 0.278261 ],
		"bgfillcolor_pt2" : [ 0.5, 0.95 ]
	}

}
