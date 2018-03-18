<?php
/*
Template Name: 字体
*/
class FontAwesomeFour {
    var $defaults;
    function menu( $nav ){
        $menu_item = preg_replace_callback(
            '/(<li[^>]+class=")([^"]+)("?[^>]+>[^>]+>)([^<]+)<\/a>/',
            array( $this, 'replace' ),
            $nav
        );
        return $menu_item;
    }
    
    function replace( $a ){
        $start = $a[ 1 ];
        $classes = $a[ 2 ];
        $rest = $a[ 3 ];
        $text = $a[ 4 ];
        $before = true;
        
        $class_array = explode( ' ', $classes );
        $fontawesome_classes = array();
        foreach( $class_array as $key => $val ){
            if( 'fa' == substr( $val, 0, 2 ) ){
                if( 'fa' == $val ){
                    unset( $class_array[ $key ] );
                } elseif( 'fa-after' == $val ){
                    $before = false;
                    unset( $class_array[ $key ] );
                } else {
                    $fontawesome_classes[] = $val;
                    unset( $class_array[ $key ] );
                }
            }
        }
        
        if( !empty( $fontawesome_classes ) ){
            $fontawesome_classes[] = 'fa';
            $settings = get_option( 'font', $this->defaults );
            if( $before ){
                if( 1 == $settings[ 'spacing' ] ){
                    $text = ' '.$text;
                }
                $newtext = '<i class="'.implode( ' ', $fontawesome_classes ).'"></i> '.$text.'';
            } else {
                if( 1 == $settings[ 'spacing' ] ){
                    $text = $text.' ';
                }
                $newtext = ''.$text.'<i class="'.implode( ' ', $fontawesome_classes ).'"></i>';
            }
        } else {
            $newtext = $text;
        }
        
        $item = $start.implode( ' ', $class_array ).$rest.$newtext.'</a>';
        return $item;
    }
    
    function wp_font_scripts(){
        wp_register_style( 'font', get_template_directory_uri(). '/css/font.min.css', array(), $this->defaults[ 'version' ], 'all' );
        wp_enqueue_style( 'font' );
    }
    
    
    function __construct(){
        $this->defaults = array(
            'maxcdn_location' => '//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css',
            'spacing' => 1,
            'stylesheet' => 'local',
            'version' => '4.3.0'
        );
        add_action( 'wp_footer', array( $this, 'wp_font_scripts' ) );
        add_filter( 'wp_nav_menu' , array( $this, 'menu' ), 10, 2 );
    }
}
new FontAwesomeFour();