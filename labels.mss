// Country labels //
#country_label[zoom>=2][zoom<=10] {
  text-name: @name;
  text-face-name: @sans_bd;
  text-placement: point;
  text-size: 10;
  text-fill: @text;
  text-halo-fill: @land;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 20;
  text-wrap-before: true;
  text-line-spacing: -3;
  [scalerank=1] {
    [zoom=3]  { text-size: 12; text-wrap-width: 60; }
    [zoom=4]  { text-size: 14; text-wrap-width: 90; }
    [zoom=5]  { text-size: 20; text-wrap-width: 120; }
    [zoom>=6] { text-size: 20; text-wrap-width: 120; }
  }
  [scalerank=2] {
    [zoom=2]  { text-name: [code]; }
    [zoom=3]  { text-size: 11; }
    [zoom=4]  { text-size: 13; }
    [zoom=5]  { text-size: 17; }
    [zoom>=6] { text-size: 20; }
  }
  [scalerank=3] {
    [zoom=3]  { text-name: [code]; }
    [zoom=4]  { text-size: 11; }
    [zoom=5]  { text-size: 15; }
    [zoom=6]  { text-size: 17; }
    [zoom=7]  { text-size: 18; text-wrap-width: 60; }
    [zoom>=8] { text-size: 20; text-wrap-width: 120; }
  }
  [scalerank=4] {
    [zoom=5] { text-size: 13; }
    [zoom=6] { text-size: 15; text-wrap-width: 60  }
    [zoom=7] { text-size: 16; text-wrap-width: 90; }
    [zoom=8] { text-size: 18; text-wrap-width: 120; }
    [zoom>=9] { text-size: 20; text-wrap-width: 120; }
  }
  [scalerank=5] {
    [zoom=5] { text-size: 11; }
    [zoom=6] { text-size: 13; }
    [zoom=7] { text-size: 14; text-wrap-width: 60; }
    [zoom=8] { text-size: 16; text-wrap-width: 90; }
    [zoom>=9] { text-size: 18; text-wrap-width: 120; }
  }
  [scalerank>=6] {
    [zoom=7] { text-size: 12; }
    [zoom=8] { text-size: 14; }
    [zoom>=9] { text-size: 16; }
  }
}


// ---------------------------------------------------------------------
// Cities, towns, villages, etc

// City labels with dots for low zoom levels.
// The separate attachment keeps the size of the XML down.
#place_label::citydots[type='city'][zoom>=4][zoom<=7][localrank<=2] {
  // explicitly defining all the `ldir` values wer'e going
  // to use shaves a bit off the final project.xml size
  [ldir='N'],[ldir='S'],[ldir='E'],[ldir='W'],
  [ldir='NE'],[ldir='SE'],[ldir='SW'],[ldir='NW'] {
    shield-file: url("shield/dot.svg");
    shield-transform:scale(0.5,0.5);
    shield-unlock-image: true;
    shield-name: @name;
    shield-size: 12;
    shield-face-name: @sans;
    shield-placement: point;
    shield-fill: @text;
    shield-halo-fill: @fill1;
    shield-halo-radius: 2;
    shield-halo-rasterizer: fast;
    shield-margin:30;
    shield-opacity:0.5;
    [zoom=7] { shield-size: 14; }

    [ldir='E'] { shield-text-dx: 5; }
    [ldir='W'] { shield-text-dx: -5; }
    [ldir='N'] { shield-text-dy: -5; }
    [ldir='S'] { shield-text-dy: 5; }
    [ldir='NE'] { shield-text-dx: 4; shield-text-dy: -4; }
    [ldir='SE'] { shield-text-dx: 4; shield-text-dy: 4; }
    [ldir='SW'] { shield-text-dx: -4; shield-text-dy: 4; }
    [ldir='NW'] { shield-text-dx: -4; shield-text-dy: -4; }
  }
}

#place_label[zoom>=8][localrank<=2] {
  text-name: @name;
  text-face-name: @sans;
  text-wrap-width: 80;
  text-wrap-before: true;
  text-fill: @text;
  text-halo-fill: @fill1;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-size: 10;
  text-line-spacing:-2;
  text-margin:25;

  // Cities
  [type='city'][zoom>=8][zoom<=15] {
  	text-face-name: @sans_md;
    text-size: 15;
    text-line-spacing:-7;

    [zoom>=10] { 
      text-size: 17;
      text-wrap-width: 140;
    }
    [zoom>=12] { 
      text-size: 20;
      text-wrap-width: 180;
    }
    // Hide at largest scales:
    [zoom>=16] { text-name: "''"; }
  }
  
  // Towns
  [type='town'] {
    text-size: 12;    
    text-halo-fill: @fill1;
    text-halo-radius: 1.9;
    [zoom>=12] { text-size: 12; }
    [zoom>=14] { text-size: 16; }
    [zoom>=16] { text-size: 22; }
    // Hide at largest scales:
    [zoom>=18] { text-name: "''"; }
  }
  
  // Villages and suburbs
  [type='village'] {
    text-size: 12;    
    text-halo-fill: @fill1;
    text-halo-radius: 1.9;
    [zoom>=12] { text-size: 10; }
    [zoom>=14] { text-size: 14; }
    [zoom>=16] { text-size: 18; }
  }
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-fill: @fill3;
    text-face-name:	@sans_it;
    text-transform: none;
    text-margin:50;
    text-halo-radius: 2;
    text-character-spacing: 0.5;
    text-size: 12;
    [zoom>=14] { text-size: 14; }
    [zoom>=15] { text-size: 16; text-character-spacing: 1; }
    [zoom>=16] { text-size: 18; text-character-spacing: 2; }
    [zoom>=18] { text-size: 24; text-character-spacing: 3; }
  }
}

// Highway Shields
#road_label::shield-pt[class='motorway'][zoom>=7][zoom<=10][localrank=1][reflen<=6],
#road_label::shield-pt[class='motorway'][zoom>=9][zoom<=10][localrank=1][reflen<=6],
#road_label::shield-ln[zoom>=11][reflen<=6] {
  shield-name: "[ref].replace('·', '\n')";
  shield-size: 9;
  shield-line-spacing: -4;
  shield-file: url('shield/[shield]-[reflen].svg');
  shield-face-name: @sans;
  shield-fill: #aaa;
  [zoom>=14] {
    shield-transform: scale(1.25,1.25);
    shield-size: 11;
  }
}
#road_label::shield-pt[class='motorway'][zoom>=7][zoom<=10][localrank=1][reflen<=6],
#road_label::shield-pt[class='motorway'][zoom>=9][zoom<=10][localrank=1][reflen<=6] {
  shield-placement: point;
  shield-avoid-edges: false;
}
#road_label::shield-ln[zoom>=11][reflen<=6] {
  shield-placement: line;
  shield-spacing: 400;
  shield-min-distance: 100;
  shield-avoid-edges: true;
}

// Road labels
#road_label[len>2000][zoom>=12],
#road_label[len>1000][zoom>=15] { 
  text-placement: line;
  text-face-name: @sans;
  text-name: @name;
  text-size: 9;
  text-min-distance: 100;
  text-halo-fill: @land;
  text-halo-radius: 1;
  text-fill: @text;
  [zoom>=17] { text-size: 11;}
}

// Water labels
#marine_label[zoom>=2]["mapnik::geometry_type"=1],
#marine_label[zoom>=2]["mapnik::geometry_type"=2] {
  text-name: @name;
  text-face-name: @sans;
  text-fill: @text;
  ["mapnik::geometry_type"=1] {
    text-placement: point;
    text-wrap-width: 30;
  }
  ["mapnik::geometry_type"=2] {
    text-placement: line;
  }
  [labelrank=1][zoom>=2],
  [labelrank=2][zoom>=3],
  [labelrank=3][zoom>=4],
  [labelrank=4][zoom>=5],
  [labelrank=5][zoom>=6],
  [labelrank=6][zoom>=7] {
    text-size: 11;
    text-character-spacing: 1;
  }
  [labelrank=1][zoom>=3],
  [labelrank=2][zoom>=4],
  [labelrank=3][zoom>=5],
  [labelrank=4][zoom>=6],
  [labelrank=5][zoom>=7],
  [labelrank=6][zoom>=8] {
    text-size: 12;
    text-character-spacing: 2;
  }
  [labelrank=1][zoom>=4],
  [labelrank=2][zoom>=5],
  [labelrank=3][zoom>=6] {
    text-size: 14;
    text-character-spacing: 4;
  }
  [labelrank=1][zoom>=5],
  [labelrank=2][zoom>=6],
  [labelrank=3][zoom>=7] {
    text-size: 16;
    text-character-spacing: 8;
  }
}

#water_label {
  [zoom<=13],
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @sans_bd;
    text-fill: @text;
    text-size: 12;
    text-halo-fill: @water;
    text-halo-radius: 1;
    text-wrap-width: 60;
    text-wrap-before: true;
    text-avoid-edges: true;
  }
}

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=14],
#waterway_label[type='stream'][zoom>=15] { 
  text-name: @name;
  text-face-name: @sans_bd;
  text-fill: @text;
  text-min-distance: 60;
  text-size: 10;
  text-halo-fill: @water;
  text-halo-radius: 1;
  text-wrap-before: true;
  text-avoid-edges: true;
  text-placement: line;
}

// Place labels
#poi_label[maki='park'][scalerank<=2],
#poi_label[maki='airport'][scalerank<=2],
#poi_label[maki='airfield'][scalerank<=2],
#poi_label[maki='rail'][scalerank<=2],
#poi_label[maki='school'][scalerank<=2],
#poi_label[scalerank='hospital'][scalerank<=2] { 
  text-face-name: @sans_bdit;
  text-allow-overlap: false;
  text-name: @name;
  text-size: 9;
  text-line-spacing: -2;
  text-min-distance: 50;
  text-wrap-width: 60;
  text-halo-fill: @fill1;
  text-halo-radius: 1;
  text-fill: @text;
}
