# select concat('wkhtmltoimage',
#     CASE
#       WHEN tags = 'navigation' THEN ' --crop-h 200 --crop-w 350'
#       WHEN tags = 'typography' THEN ' --crop-h 350 --crop-w 450'
#       WHEN tags = 'forms'      THEN ' --crop-h 300 --crop-w 300'
#       ELSE                          ' --crop-h 200 --crop-w 300'
#     END,
#   ' local.hashedin.com/lt_admin/services/styles/preview?theme=',theme_name, ' ', theme_name, '.jpg')
# from theme
# order by theme_name;

# mogrify -resize 100 *.jpg


wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-candy button-candy.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-cupid-blue button-cupid-blue.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-cupid-green button-cupid-green.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-default button-default.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-dribble button-dribble.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-elegant button-elegant.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-indent button-indent.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-hashedin button-hashedin.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-minimal button-minimal.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-pill button-pill.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-punch button-punch.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-shiny button-shiny.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-simple button-simple.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-slick button-slick.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=button-thoughtbot button-thoughtbot.jpg

wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Amber-Waves color-Amber-Waves.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Artificial-Growth color-Artificial-Growth.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Autumn-an-Empire color-Autumn-an-Empire.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Baked color-Baked.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Banana-Flambe color-Banana-Flambe.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-black color-black.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-black-1 color-black-1.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-blue color-blue.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-bluelt color-bluelt.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Bluish color-Bluish.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-brown color-brown.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Candid color-Candid.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Cheesecake color-Cheesecake.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Chocolate color-Chocolate.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Christmas-Wishes color-Christmas-Wishes.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Citrus color-Citrus.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Corn-Roast color-Corn-Roast.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Cubicle-Blue color-Cubicle-Blue.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Cupacabra color-Cupacabra.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Dark-Green color-Dark-Green.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Down-to-Earth color-Down-to-Earth.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Egg color-Egg.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Firenze color-Firenze.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Flower-Shop color-Flower-Shop.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Garden-Pool color-Garden-Pool.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Granny-Smith-Apple color-Granny-Smith-Apple.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Graphite color-Graphite.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Gray color-Gray.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-green color-green.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Halow-Summer color-Halow-Summer.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Happy-Holidays color-Happy-Holidays.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Herbs-and-Spice color-Herbs-and-Spice.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Indigo color-Indigo.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-ivory color-ivory.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Japanese-Garden color-Japanese-Garden.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Ketchup color-Ketchup.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Light-Green color-Light-Green.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Marie-Antoinette color-Marie-Antoinette.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Modern-Office color-Modern-Office.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Mustard color-Mustard.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Ocean-Sunset color-Ocean-Sunset.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Old-Man-Winter color-Old-Man-Winter.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Orange color-Orange.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-orange-1 color-orange-1.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-orange-2 color-orange-2.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-orange-3 color-orange-3.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Pink color-Pink.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Pistachio color-Pistachio.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Purple color-Purple.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-purple-1 color-purple-1.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Purple-Dress color-Purple-Dress.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Range-Rover color-Range-Rover.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Recycled-Air color-Recycled-Air.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Red color-Red.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-red-1 color-red-1.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Robotron color-Robotron.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Sailboat color-Sailboat.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Sandy-Beach color-Sandy-Beach.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Scandinavian-Woodworks color-Scandinavian-Woodworks.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Summer color-Summer.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Tree-Viper color-Tree-Viper.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Violet color-Violet.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-Watermelon color-Watermelon.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-yellow color-yellow.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-yellow-light color-yellow-light.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=color-yellowct color-yellowct.jpg

wkhtmltoimage --crop-h 300 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=forms-default-fields forms-default-fields.jpg
wkhtmltoimage --crop-h 300 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=forms-stacked-fields forms-stacked-fields.jpg

wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-bar navigation-bar.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-bar-groove navigation-bar-groove.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-bar-outset navigation-bar-outset.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-full-bar navigation-full-bar.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-full-bar-001 navigation-full-bar-001.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-full-bar-002 navigation-full-bar-002.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-full-bar-groove navigation-full-bar-groove.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-full-bar-groove-001 navigation-full-bar-groove-001.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-full-width-simple navigation-full-width-simple.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-pills navigation-pills.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-pills-001 navigation-pills-001.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-tabs navigation-tabs.jpg
wkhtmltoimage --crop-h 200 --crop-w 350 local.hashedin.com/lt_admin/services/styles/preview?theme=navigation-tabs-001 navigation-tabs-001.jpg

wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=table-bordered table-bordered.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=table-bordered-zs table-bordered-zs.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=table-default table-default.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=table-default-zs table-default-zs.jpg

wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Arial typography-Arial.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Baskerville typography-Baskerville.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Cambria typography-Cambria.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-CenturyGothic typography-CenturyGothic.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Consolas typography-Consolas.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-CopperplateLight typography-CopperplateLight.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-CourierNew typography-CourierNew.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-FFMetaSerifWebPro-FFMetaWebPro typography-FFMetaSerifWebPro-FFMetaWebPro.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-FranklinGothicMedium typography-FranklinGothicMedium.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Futura typography-Futura.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Garamond typography-Garamond.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Geneva typography-Geneva.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Georgia typography-Georgia.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Georgia-Lucida typography-Georgia-Lucida.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-GillSans typography-GillSans.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Helvetica-HelveticaNeue typography-Helvetica-HelveticaNeue.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Impact typography-Impact.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-LucidaSans typography-LucidaSans.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Palatino typography-Palatino.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Tahoma typography-Tahoma.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Times typography-Times.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-TrebuchetMS typography-TrebuchetMS.jpg
wkhtmltoimage --crop-h 350 --crop-w 450 local.hashedin.com/lt_admin/services/styles/preview?theme=typography-Verdana typography-Verdana.jpg

wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=widget-elegant widget-elegant.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=widget-inset widget-inset.jpg
wkhtmltoimage --crop-h 200 --crop-w 300 local.hashedin.com/lt_admin/services/styles/preview?theme=widget-simple widget-simple.jpg
