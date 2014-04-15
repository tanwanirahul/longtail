var COLOR_PALETTES = [["#66FFFF","#FFFF33","#33FF33"],
["#028482","#7ABA7A","#B76EB8"],
["#005B9A","#0191C8","#74C2E1","#8C8984"],
["#A31E39","#485C5A","#8C9C9A","#9DB2B1","#BFCFCC","#D6E4E1"],
["#054950","#789A9F","#EDF4F5","#FFFFFF","#F78F1E"],
["#6BCAE2","#51A5BA","#41924B","#AFEAAA","#87E293","#FE8402"],
["#4D8963","#69A583","#E1B378","#E0CC97","#EC799A","#9F0251"],
["#BED661","#89E894","#78D5E3","#7AF5F5","#34DDDD","#93E2D5"],
["#996699","#CCCCCC","#000000","#006699"],
["#003366","#996699","#CCFF33","#00FF99"],
["#AA0078","#000078","#B3B3D7","#D1CAB0"],
["#000000","#CC99CC","#FFFFFF","#660066"],
["#660033","#E0E6FF","#777B88","#330033"],
["#692DAC","#9D538E","#34ACAF"],
["#028482","#7ABA7A","#B76EB8"],
["#333333","#FFCC00","#669966","#993366"],
["#6F0564","#F6FA9C","#8CA93E","#8C001A"],
["#990099","#FFFFFF","#FFFF00"],
["#000066","#FFFFCC","#CCCCFF","#990066"],
["#FF0080","#FFFFFF","#800080"],
["#0F0B19","#FFCF00","#C5E946","#AF4FA2"],
["#999999","#990033","#FFFF00","#330033"],
["#D3649F","#666666","#000000","#FFFFFF"],
["#84596B","#B58AA5","#CECFCE","#FFFFFF"],
["#9C0063","#D693BD","#EFD3E7","#FFFFFF"],
["#7D9C9F","#BDD8DA","#DFEFF0","#AD235E","#ECECEC","#B1B1B1"],
["#484452","#F8F2DA","#C7AFBD","#DDECEF"],
["#9DAF72","#566047","#562F32","#462D44","#859731","#640E27"],
["#759564","#CDDB9D","#F4F7EC","#EFD9DC","#DAB4C9"],
["#4D8963","#69A583","#E1B378","#E0CC97","#EC799A","#9F0251"],
["#421C52","#732C7B","#9C8AA5","#BDAEC6","#FFFFFF"],
["#FFBE00","#9DD52A","#AC54AA","#666666","#000000"],
["#660F57","#663366","#003366","#E7EBF0","#B1BDCD","#5B7290"],
["#D31D8C","#EE88CD","#4DC5D6","#A5F2F3","#BCDD11","#F1FAC0"],
["#983265","#986598","#979735","#339798","#006699","#CCCC99"],
["#9C1C6B","#CA278C","#E47297","#FFE9E8","#AA0114","#000000"],
["#CC1559","#FF5EAA","#96B3D3","#FFFFFF","#585858","#646464"],
["#AD0066","#D13D94","#F5851F","#CADA2A","#81A4B9","#CFE8F6"],
["#570F48","#872D7D","#F398E9","#FFC128","#FFDC8A","#3B3A3A"],
["#177F75","#21B6A8","#7F1769","#FFCBF4","#B69521","#FFF4CB"],
["#B96A9A","#D889B8","#9CC089","#D8F3C9","#FDE8D7","#FFFFFF"],
["#E850A8","#D0AC11","#F5F1DE","#000316"],
["#993300","#99CC99","#003366"],
["#6600CC","#FFCC00","#000000","#CC0000"],
["#000000","#00FF00","#FF6600","#000066"],
["#CCCCCC","#000000","#FF6600"],
["#1F1209","#003366","#FFF8DC","#834C24"],
["#FFFF66","#FFCC00","#FF9900","#FF0000"],
["#CC0000","#99FF00","#FFCC00","#3333FF"],
["#3399CC","#CDB99C","#FFFFFF","#330000"],
["#CC6600","#FFFBD0","#FF9900","#C13100"],
["#0000FF","#FF0000","#FFFFFF","#333333"],
["#FFD800","#587058","#587498","#E86850"],
["#003366","#FFFFFF","#FF6600"],
["#400D12","#4FD5D6","#FF0000","#CDFFFF"],
["#FF3333","#999999","#669999","#003333"],
["#0000FF","#00FF00","#FF0000","#000000"],
["#5F9EA0","#FFFF99","#B22222"],
["#003366","#3399FF","#FFCC99","#FF9966"],
["#FF6600","#666633","#000099","#FFCC00"],
["#FF6600","#FFFF66","#009933"],
["#CD5C5C","#F5F5F5","#FFFE59","#F3EFE0"],
["#CC3300","#663333","#FFCC99","#000000"],
["#D6BF86","#FFFBD0","#9C2A00"],
["#9C9F84","#A97D5D","#F7DCB4","#5C755E"],
["#666633","#999966","#CC6666","#663333"],
["#CC0000","#FF6600","#660099","#000000"],
["#528413","#2088B2","#D86E3F"],
["#FF9900","#CC3333","#FFCC00"],
["#AA1111","#FFFFFF","#EBEBEB","#000000"],
["#D08504","#000000","#29407C","#660000"],
["#FF2400","#FFCC00","#FFFFFF","#000084"],
["#CE0000","#000063","#5A79A5","#9CAAC6","#DEE7EF"],
["#5C604D","#FFBAD2","#F20056","#E5E7E1","#C8CFB4","#A3AE7E"],
["#F2BC00","#FFF0BA","#FF542E","#CFD6DE","#ADC1D6","#7297BA"],
["#A31E39","#485C5A","#8C9C9A","#9DB2B1","#BFCFCC","#D6E4E1"],
["#CEEBFB","#A3D6F5","#66A7C5","#EE3233","#F0ECEB","#6C7476"],
["#627894","#A0AEC1","#466289","#DBE8F9","#FA6121","#FFB739"],
["#CE0000","#C6CFD6","#E7E7EF","#FFFFFF","#003031"],
["#859797","#919581","#DEE0D5","#D84E13"],
["#FFB310","#6F684E","#FA0026","#42361E"],
["#DADDE2","#C9D255","#5F6B77","#D16405"],
["#1B2A16","#FFC629","#FF8F00","#5A0000"],
["#F4F4AF","#E1EDCF","#D44302","#3F6B03"],
["#D5D0B0","#739240","#C86000","#425227"],
["#FFCC33","#FF6600","#A45209","#533419"],
["#667B99","#AFBBD2","#CCD5E6","#E9EEF6","#FF6637"],
["#009ECE","#FF9E00","#F7D708","#CE0000","#9CCF31"],
["#CCDDDD","#AAC4C4","#9EAEB3","#93AAAB","#749749","#CE3100"],
["#154890","#6699FF","#CDBFAC","#E1D4C0","#F5EDE3","#FF6600"],
["#FFC3CE","#D6E3B5","#6B824A","#FFF7EF","#636563"],
["#9CB6D6","#F7E7BD","#CEC7C6","#B59A73","#94927B"],
["#EF597B","#FF6D31","#73B66B","#FFCB18","#29A2C6"],
["#595F23","#829F53","#A2B964","#5F1E02","#E15417","#FCF141"],
["#E2DC7C","#A3CD39","#F43E71","#4A4A4A"],
["#771100","#CC6633","#FF9900","#999999","#CCCCCC"],
["#9EB847","#F3F3CC","#FEBF10","#C87533","#F9F7ED","#33170D"],
["#4F2412","#C9A798","#E9E0DB","#F9F6F4","#CCCCCC"],
["#000000","#2F4E6F","#98B1C4","#C8D7E3","#E15119","#CCCCCC"],
["#E7DBBD","#CEDFEF","#525552","#C64521"],
["#524D4A","#FFFFFF","#6B7552","#4A6D18"],
["#2D3956","#455372","#616A7F","#E7E7E7","#E0E9E9","#FF1A00"],
["#1B619B","#ACCBE0","#D3E0EA","#F8F2E5","#9A9A9B","#D75A20"],
["#FFEC94","#FFAEAE","#FFF0AA","#B0E57C","#B4D8E7","#56BAEC"],
["#405774","#6787B0","#B1B17B","#CD6607","#F6A03D"],
["#917567","#7F7C5D","#CCCAB1","#D6D5C0","#E1E0CE"],
["#C86000","#D68840","#72923F","#467408","#404040"],
["#3F547F","#999FAD","#A8ACB8","#DDDDDD","#F58735"],
["#670A0A","#831515","#F8F2E5","#FFFFFF"],
["#184D68","#31809F","#FB9C6C","#D55121","#CFE990","#EAFBC5"],
["#D31D8C","#EE88CD","#4DC5D6","#A5F2F3","#BCDD11","#F1FAC0"],
["#9C1C6B","#CA278C","#E47297","#FFE9E8","#AA0114","#000000"],
["#1F4864","#D7E2E9","#FFFFFF","#FFCB35","#E95C40","#50021B"],
["#005099","#7C7062","#1A62A3","#B4A28F","#F7F6F4","#E0EAF4"],
["#CF5300","#FF6600","#333333","#EB5E00","#4D1E00","#FF7619"],
["#000000","#2956B2","#659CEF","#7DBD00","#DCF600","#FF5B00"],
["#AD0066","#D13D94","#F5851F","#CADA2A","#81A4B9","#CFE8F6"],
["#A25F08","#F4E6CC","#FCF5EB","#2F8CAB","#C9E2E9","#FE4902"],
["#570F48","#872D7D","#F398E9","#FFC128","#FFDC8A","#3B3A3A"],
["#21B6A8","#CBFFFA","#7F1917","#7F3D17","#FFD197","#FFCCCB"],
["#105952","#177F75","#CBFFFA","#7F3D17","#7F5E17","#22287F"],
["#990000","#CCCC66","#F1F1D4","#FFFFFF"],
["#E8110F","#FBC723","#1B6AA5"],
["#D52315","#FFFFFF","#FBB601"],
["#D5331E","#FFD900"],
["#D5331E","#FFFFFF","#6078D8"],
["#3964C3","#000000","#D34328"],
["#927B51","#A89166","#80C31C","#BCDD5A","#FF7900","#FBB36B"],
["#B96A9A","#D889B8","#9CC089","#D8F3C9","#FDE8D7","#FFFFFF"],
["#F2F5ED","#FFC200","#FF5B00","#B80028","#84002E","#4AC0F2"],
["#FDB813","#F68B1F","#F17022","#62C2CC","#E4F6F8","#EEF66C"],
["#EFD279","#95CBE9","#024769","#AFD775","#2C5700","#DE9D7F"],
["#2B3E42","#747E80","#D5E1DD","#F7F3E8","#F2583E","#77BED2"],
["#C73B0B","#F2C545","#978E43","#350608"],
["#00628B","#E6E6DC","#81A594"],
["#0099CC","#CCFFCC","#66CCFF","#003399"],
["#217C7E","#F3EFE0","#3399FF","#9A3334"],
["#400D12","#4FD5D6","#FF0000","#CDFFFF"],
["#FF3333","#999999","#669999","#003333"],
["#79BEDB","#593E1A","#6B78B4","#266A2E"],
["#3F5F5F","#FFFF66","#2F4F4F"],
["#692DAC","#9D538E","#34ACAF"],
["#66FFFF","#FFFF33","#33FF33"],
["#5F9EA0","#FFFF99","#B22222"],
["#028482","#7ABA7A","#B76EB8"],
["#003333","#CCCC99","#666699","#003366"],
["#333366","#CCFFFF","#336666"],
["#528413","#2088B2","#D86E3F"],
["#006699","#FFFF81","#000000","#0099CC"],
["#003399","#CCFFCC","#0099CC"],
["#FF9933","#003399","#99CCCC","#CCCCCC"],
["#006400","#B0C4DE","#0099CC","#CCFFFF"],
["#00FF00","#004040","#D0CA9C","#000000"],
["#005B9A","#0191C8","#74C2E1","#8C8984"],
["#E8D0A9","#B7AFA3","#C1DAD6","#F5FAFA","#ACD1E9","#6D929B"],
["#7D9C9F","#BDD8DA","#DFEFF0","#AD235E","#ECECEC","#B1B1B1"],
["#A31E39","#485C5A","#8C9C9A","#9DB2B1","#BFCFCC","#D6E4E1"],
["#0C2C52","#5F6B61","#5E9DC8","#DCF0F7"],
["#484452","#F8F2DA","#C7AFBD","#DDECEF"],
["#DDECEF","#BFD9DA","#87AAAE","#BC4676","#F6F6F6","#B8B9BB"],
["#CEEBFB","#A3D6F5","#66A7C5","#EE3233","#F0ECEB","#6C7476"],
["#8CC739","#085DAD","#21BEDE","#FFFFFF","#31C3E7","#ADB6B5"],
["#054950","#789A9F","#EDF4F5","#FFFFFF","#F78F1E"],
["#6BCAE2","#51A5BA","#41924B","#AFEAAA","#87E293","#FE8402"],
["#CE0000","#C6CFD6","#E7E7EF","#FFFFFF","#003031"],
["#CC9900","#FFDE00","#006666","#006699","#000066"],
["#859797","#919581","#DEE0D5","#D84E13"],
["#EDBD3E","#5B7778","#93A8A9","#D1E6E7"],
["#D3E1E4","#C9CACE","#D9D4AE","#575234"],
["#298F00","#CAE4F1","#0588BC","#00578A"],
["#3D6A7D","#D3CEC3","#FFFFFF"],
["#009ECE","#FF9E00","#F7D708","#CE0000","#9CCF31"],
["#CCDDDD","#AAC4C4","#9EAEB3","#93AAAB","#749749","#CE3100"],
["#BED661","#89E894","#78D5E3","#7AF5F5","#34DDDD","#93E2D5"],
["#EF597B","#FF6D31","#73B66B","#FFCB18","#29A2C6"],
["#EB8921","#F5AD28","#FFFFFF","#2E2F2F","#1E1E1E","#000000"],
["#4A7B6F","#EEEEE7","#CCDDDD","#9EAEB3","#242E35"],
["#BDC3C6","#7BC342","#4AB2D6","#006594"],
["#2D3956","#455372","#616A7F","#E7E7E7","#E0E9E9","#FF1A00"],
["#0D3257","#97A7B7","#B2C2B9","#BDD6E0","#65754D","#C7DBA9"],
["#006666","#9DBCBC","#FFCC66","#FFEEBB","#6B6B6B","#B7B7B7"],
["#656868","#F2C968","#F3E7A9","#A5A162","#515230"],
["#47697E","#688B9A","#5B7444","#A3C586","#FFCC33","#FCF1D1"],
["#FFEC94","#FFAEAE","#FFF0AA","#B0E57C","#B4D8E7","#56BAEC"],
["#184D68","#31809F","#FB9C6C","#D55121","#CFE990","#EAFBC5"],
["#213240","#90AEC6","#10C8CD","#EC1559","#FAF93C"],
["#D31D8C","#EE88CD","#4DC5D6","#A5F2F3","#BCDD11","#F1FAC0"],
["#983265","#986598","#979735","#339798","#006699","#CCCC99"],
["#557260","#6A8B92","#8A9875","#34626B","#EAEEEA","#3291B1"],
["#A25F08","#F4E6CC","#FCF5EB","#2F8CAB","#C9E2E9","#FE4902"],
["#000000","#303F42","#55676A","#6C7A7D","#FFFFFF","#EEC015"],
["#1A2828","#28AF63","#C2D98B"],
["#F2F5ED","#FFC200","#FF5B00","#B80028","#84002E","#4AC0F2"],
["#9BE1FB","#C5EFFD","#BD2031","#231F20","#FFFFFF","#006295"],
["#FDB813","#F68B1F","#F17022","#62C2CC","#E4F6F8","#EEF66C"],
["#6D98AB","#00275E","#FEB729","#A8B1B8","#FFFFFF","#000000"],
["#2B3E42","#747E80","#D5E1DD","#F7F3E8","#F2583E","#77BED2"],
["#298F00","#CAE4F1","#0588BC","#00578A"],
["#FF8F00","#5A8F29","#3C7DC4","#2B2B2B"],
["#097054","#FFDE00","#6599FF","#FF9900"],
["#993300","#99CC99","#003366"],
["#92CD00","#FFCF79","#E5E4D7","#2C6700"],
["#6600CC","#FFCC00","#000000","#CC0000"],
["#000000","#00FF00","#FF6600","#000066"],
["#CCCCCC","#000000","#FF6600"],
["#1F1209","#003366","#FFF8DC","#834C24"],
["#FFFF66","#FFCC00","#FF9900","#FF0000"],
["#CC0000","#99FF00","#FFCC00","#3333FF"],
["#3399CC","#CDB99C","#FFFFFF","#330000"],
["#217C7E","#F3EFE0","#3399FF","#9A3334"],
["#CC9752","#CCCC00","#E5DBCF","#0F3B5F"],
["#CC6600","#FFFBD0","#FF9900","#C13100"],
["#AA0078","#000078","#B3B3D7","#D1CAB0"],
["#003366","#FFFFFF","#FF6600"],
["#99CCFF","#FFCC00","#99CC99"],
["#FF3333","#999999","#669999","#003333"],
["#003366","#CCCCCC","#FFCC00"],
["#000066","#FFFFFF","#FFCC00"],
["#79BEDB","#593E1A","#6B78B4","#266A2E"],
["#996600","#FFFFFF","#000000"],
["#003366","#3399FF","#FFCC99","#FF9966"],
["#FF6600","#666633","#000099","#FFCC00"],
["#00CC00","#FF9900","#000099"],
["#FFCC00","#CCCCCC","#666699"],
["#333333","#FFCC00","#669966","#993366"],
["#FF6600","#FFFF66","#009933"],
["#CD5C5C","#F5F5F5","#FFFE59","#F3EFE0"],
["#CC3300","#663333","#FFCC99","#000000"],
["#AAF200","#FFCF75","#FF8000","#000000"],
["#000000","#FFFFFF","#E18A07","#C0C0C0"],
["#FFCC00","#99CC99","#FFCC00"],
["#D6BF86","#FFFBD0","#9C2A00"],
["#9C9F84","#A97D5D","#F7DCB4","#5C755E"],
["#CC9933","#FFFFFF","#336699"],
["#CC0000","#FF6600","#660099","#000000"],
["#528413","#2088B2","#D86E3F"],
["#FF9933","#003399","#99CCCC","#CCCCCC"],
["#FF9900","#336688","#FFCC00"],
["#0F0B19","#FFCF00","#C5E946","#AF4FA2"],
["#333366","#FFFFFF","#FF9933","#000000"],
["#FF9900","#CC3333","#FFCC00"],
["#FFCC00","#CCCC99","#6A6A5A","#000066"],
["#996633","#FFFFFF","#336699"],
["#8B88FF","#FF9C00","#7BB31A","#EEDB00"],
["#336699","#FFCC66","#FFFFFF","#003366"],
["#D5D50D","#FDF8F2","#EAB988","#CC6600"],
["#D08504","#000000","#29407C","#660000"],
["#FF2400","#FFCC00","#FFFFFF","#000084"],
["#663300","#CC9900","#333300","#CC6600"],
["#000066","#E0F4FF","#FFFFFF","#FFCC00"],
["#FFCC00","#FFFFFF","#666666"],
["#191970","#FFEBCD","#4682B4"],
["#333333","#FF9900","#FFFFFF","#666666"],
["#9CAA9C","#BDCFBD","#CEDFCE","#EFEFDE","#BD9A52"],
["#005B9A","#0191C8","#74C2E1","#8C8984"],
["#DBE3F0","#B3BCCC","#8D96A8","#737C8C","#596171","#D8A412"],
["#E8D0A9","#B7AFA3","#C1DAD6","#F5FAFA","#ACD1E9","#6D929B"],
["#F2BC00","#FFF0BA","#FF542E","#CFD6DE","#ADC1D6","#7297BA"],
["#484452","#F8F2DA","#C7AFBD","#DDECEF"],
["#CEEBFB","#A3D6F5","#66A7C5","#EE3233","#F0ECEB","#6C7476"],
["#F4F5E7","#82A9D0","#6D8CA0","#BACFE4","#FF9E01","#454F8C"],
["#627894","#A0AEC1","#466289","#DBE8F9","#FA6121","#FFB739"],
["#054950","#789A9F","#EDF4F5","#FFFFFF","#F78F1E"],
["#6BCAE2","#51A5BA","#41924B","#AFEAAA","#87E293","#FE8402"],
["#CC9900","#FFDE00","#006666","#006699","#000066"],
["#4D8963","#69A583","#E1B378","#E0CC97","#EC799A","#9F0251"],
["#EDBD3E","#495E88","#A0AEC1"],
["#859797","#919581","#DEE0D5","#D84E13"],
["#EDBD3E","#5B7778","#93A8A9","#D1E6E7"],
["#5A6571","#8A939D","#A2A9AF","#E5E8ED","#FD9308"],
["#FFB310","#6F684E","#FA0026","#42361E"],
["#DADDE2","#C9D255","#5F6B77","#D16405"],
["#76988F","#AC8C18","#3F3C29","#262416"],
["#1B2A16","#FFC629","#FF8F00","#5A0000"],
["#F4F4AF","#E1EDCF","#D44302","#3F6B03"],
["#D5D0B0","#739240","#C86000","#425227"],
["#FF8F00","#5A8F29","#3C7DC4","#2B2B2B"],
["#FFCC33","#FF6600","#A45209","#533419"],
["#3D6A7D","#D3CEC3","#FFFFFF"],
["#CC6600","#6699CC","#99CCFF","#CAE5FF","#DCDCDC","#EEEEEE"],
["#667B99","#AFBBD2","#CCD5E6","#E9EEF6","#FF6637"],
["#009ECE","#FF9E00","#F7D708","#CE0000","#9CCF31"],
["#CCDDDD","#AAC4C4","#9EAEB3","#93AAAB","#749749","#CE3100"],
["#154890","#6699FF","#CDBFAC","#E1D4C0","#F5EDE3","#FF6600"],
["#FFC3CE","#D6E3B5","#6B824A","#FFF7EF","#636563"],
["#9CB6D6","#F7E7BD","#CEC7C6","#B59A73","#94927B"],
["#C6C78C","#E7C39C","#E7DF9C","#DEE79C","#EFEBD6"],
["#EF597B","#FF6D31","#73B66B","#FFCB18","#29A2C6"],
["#FFBE00","#9DD52A","#AC54AA","#666666","#000000"],
["#595F23","#829F53","#A2B964","#5F1E02","#E15417","#FCF141"],
["#424242","#C5BD99","#FFFFFF","#701112"],
["#F3F4EC","#CCCFBC","#A37B45","#86942A","#507642"],
["#E9DCB9","#BB772E","#817D62","#2E3F53"],
["#771100","#CC6633","#FF9900","#999999","#CCCCCC"],
["#638291","#E8EFF3","#FFCC33","#FCF1D1","#5B7444","#A3C586"],
["#9EB847","#F3F3CC","#FEBF10","#C87533","#F9F7ED","#33170D"],
["#EB8921","#F5AD28","#FFFFFF","#2E2F2F","#1E1E1E","#000000"],
["#4F2412","#C9A798","#E9E0DB","#F9F6F4","#CCCCCC"],
["#BAA378","#C0A172","#BAA378","#382E1C","#453823","#2C2416"],
["#245481","#B1C3D4","#DCA80A","#7C9343","#677A38","#TEST188"],
["#FFA300","#335A9A","#C2B999","#D5CBA8","#DAD1B2","#EDEBD6"],
["#000000","#2F4E6F","#98B1C4","#C8D7E3","#E15119","#CCCCCC"],
["#E7DBBD","#CEDFEF","#525552","#C64521"],
["#524D4A","#FFFFFF","#6B7552","#4A6D18"],
["#DEDFE7","#ADB2BD","#B57D29","#102873"],
["#1B619B","#ACCBE0","#D3E0EA","#F8F2E5","#9A9A9B","#D75A20"],
["#006666","#9DBCBC","#FFCC66","#FFEEBB","#6B6B6B","#B7B7B7"],
["#656868","#F2C968","#F3E7A9","#A5A162","#515230"],
["#47697E","#688B9A","#5B7444","#A3C586","#FFCC33","#FCF1D1"],
["#FFEC94","#FFAEAE","#FFF0AA","#B0E57C","#B4D8E7","#56BAEC"],
["#405774","#6787B0","#B1B17B","#CD6607","#F6A03D"],
["#917567","#7F7C5D","#CCCAB1","#D6D5C0","#E1E0CE"],
["#54A4DE","#BBD9EE","#EBF4FA","#206BA4","#FFAB35"],
["#B0E57C","#FFEC94","#9BD1FA","#FFFFFF","#000000"],
["#C86000","#D68840","#72923F","#467408","#404040"],
["#3F547F","#999FAD","#A8ACB8","#DDDDDD","#F58735"],
["#32556B","#3A5D73","#7495AB","#7DDF17","#FFC605"],
["#3A5D73","#32556B","#488FC8","#6CCB17","#FFC605"],
["#111111","#DED5B3","#D3CAAA","#E3DBBE","#FFA300"],
["#670A0A","#831515","#F8F2E5","#FFFFFF"],
["#184D68","#31809F","#FB9C6C","#D55121","#CFE990","#EAFBC5"],
["#0E426C","#546F8B","#6586A7","#5F021F","#FFC652","#83AE84"],
["#374D3C","#355842","#4A6751","#F29F01","#AFAFA8","#DADAD4"],
["#561420","#821122","#C59A6F","#333333","#CCCCCC","#FCFCFC"],
["#1F4864","#D7E2E9","#FFFFFF","#FFCB35","#E95C40","#50021B"],
["#005099","#7C7062","#1A62A3","#B4A28F","#F7F6F4","#E0EAF4"],
["#CF5300","#FF6600","#333333","#EB5E00","#4D1E00","#FF7619"],
["#000000","#2956B2","#659CEF","#7DBD00","#DCF600","#FF5B00"],
["#AD0066","#D13D94","#F5851F","#CADA2A","#81A4B9","#CFE8F6"],
["#A25F08","#F4E6CC","#FCF5EB","#2F8CAB","#C9E2E9","#FE4902"],
["#570F48","#872D7D","#F398E9","#FFC128","#FFDC8A","#3B3A3A"],
["#000000","#303F42","#55676A","#6C7A7D","#FFFFFF","#EEC015"],
["#21B6A8","#CBFFFA","#7F1917","#7F3D17","#FFD197","#FFCCCB"],
["#105952","#177F75","#CBFFFA","#7F3D17","#7F5E17","#22287F"],
["#177F75","#21B6A8","#7F1769","#FFCBF4","#B69521","#FFF4CB"],
["#21B6A8","#177F75","#B6212D","#7F171F","#B67721","#7F5417"],
["#F1921A","#669900","#656E75","#E6E7E8","#679EC9","#FFFFFF"],
["#9C9284","#CCCC99","#E6E6CC","#6699CC","#FF9900","#000000"],
["#3D362D","#665847","#FEFFFD","#FF9900"]];

var COLOR_PALETTE_UTILS = {pallete: null};

COLOR_PALETTE_UTILS.getCurrent = function()
{
	if(this.pallete == null)
	{
		this.pallete = Utils.random(COLOR_PALETTES);
	}
	
	return this.pallete;
}

COLOR_PALETTE_UTILS.get = function()
{
	return Utils.random(COLOR_PALETTE_UTILS.getCurrent());
}

/**
 * Converts an RGB color value to HSL. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
 * Assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and l in the set [0, 1].
 *
 * @param   Number  r       The red color value
 * @param   Number  g       The green color value
 * @param   Number  b       The blue color value
 * @return  Array           The HSL representation
 */
COLOR_PALETTE_UTILS.rgbToHsl = function(r, g, b){
    r /= 255, g /= 255, b /= 255;
    var max = Math.max(r, g, b), min = Math.min(r, g, b);
    var h, s, l = (max + min) / 2;

    if(max == min){
        h = s = 0; // achromatic
    }else{
        var d = max - min;
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
        switch(max){
            case r: h = (g - b) / d + (g < b ? 6 : 0); break;
            case g: h = (b - r) / d + 2; break;
            case b: h = (r - g) / d + 4; break;
        }
        h /= 6;
    }

    return [h, s, l];
}

/**
 * Converts an HSL color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
 * Assumes h, s, and l are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  l       The lightness
 * @return  Array           The RGB representation
 */
COLOR_PALETTE_UTILS.hslToRgb = function(h, s, l){
    var r, g, b;

    if(s == 0){
        r = g = b = l; // achromatic
    }else{
        function hue2rgb(p, q, t){
            if(t < 0) t += 1;
            if(t > 1) t -= 1;
            if(t < 1/6) return p + (q - p) * 6 * t;
            if(t < 1/2) return q;
            if(t < 2/3) return p + (q - p) * (2/3 - t) * 6;
            return p;
        }

        var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
        var p = 2 * l - q;
        r = hue2rgb(p, q, h + 1/3);
        g = hue2rgb(p, q, h);
        b = hue2rgb(p, q, h - 1/3);
    }

    return [r * 255, g * 255, b * 255];
}

/**
 * Converts an RGB color value to HSV. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and v in the set [0, 1].
 *
 * @param   Number  r       The red color value
 * @param   Number  g       The green color value
 * @param   Number  b       The blue color value
 * @return  Array           The HSV representation
 */
COLOR_PALETTE_UTILS.rgbToHsv = function(r, g, b){
    r = r/255, g = g/255, b = b/255;
    var max = Math.max(r, g, b), min = Math.min(r, g, b);
    var h, s, v = max;

    var d = max - min;
    s = max == 0 ? 0 : d / max;

    if(max == min){
        h = 0; // achromatic
    }else{
        switch(max){
            case r: h = (g - b) / d + (g < b ? 6 : 0); break;
            case g: h = (b - r) / d + 2; break;
            case b: h = (r - g) / d + 4; break;
        }
        h /= 6;
    }

    return [h, s, v];
}

/**
 * Converts an HSV color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes h, s, and v are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  v       The value
 * @return  Array           The RGB representation
 */
COLOR_PALETTE_UTILS.hsvToRgb = function(h, s, v){
    var r, g, b;

    var i = Math.floor(h * 6);
    var f = h * 6 - i;
    var p = v * (1 - s);
    var q = v * (1 - f * s);
    var t = v * (1 - (1 - f) * s);

    switch(i % 6){
        case 0: r = v, g = t, b = p; break;
        case 1: r = q, g = v, b = p; break;
        case 2: r = p, g = v, b = t; break;
        case 3: r = p, g = q, b = v; break;
        case 4: r = t, g = p, b = v; break;
        case 5: r = v, g = p, b = q; break;
    }

    return [r * 255, g * 255, b * 255];
}

COLOR_PALETTE_UTILS.cutHex = function(h) {
	return (h.charAt(0)=="#") ? h.substring(1,7):h;
}

COLOR_PALETTE_UTILS.HexToRGB = function(h)
{
	var r = parseInt((this.cutHex(h)).substring(0,2),16);
	var g = parseInt((this.cutHex(h)).substring(2,4),16);
	var b = parseInt((this.cutHex(h)).substring(4,6),16);
	return [r,g,b];
}

COLOR_PALETTE_UTILS.contrast = function($R1,$G1,$B1,$R2,$G2,$B2){
    $L1 = 0.2126 * Math.pow($R1/255, 2.2) +
          0.7152 * Math.pow($G1/255, 2.2) +
          0.0722 * Math.pow($B1/255, 2.2);
 
    $L2 = 0.2126 * Math.pow($R2/255, 2.2) +
          0.7152 * Math.pow($G2/255, 2.2) +
          0.0722 * Math.pow($B2/255, 2.2);
 
    if($L1 > $L2){
        return ($L1+0.05) / ($L2+0.05);
    }else{
        return ($L2+0.05) / ($L1+0.05);
    }
}