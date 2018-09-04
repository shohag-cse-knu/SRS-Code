/*To Register Widgets(Sidebar menu/left menu)*/

                (functions.php)

function rasel_widget_areas() {
	register_sidebar( array(
		'name' => __( 'Left Menu', 'rasel' ),
		'id' => 'left_sidebar',
		'before_widget' => '<div class="single_sidebar">',
		'after_widget' => '</div>',
	    'before_title' => '<h2>',
	    'after_title' => '</h2>',
	) );
}
add_action('widgets_init', 'rasel_widget_areas');


                 (sidebar.php)               
<?php dynamic_sidebar('left_sidebar'); ?> /*(Where the widget/sidebar/left menu will be called)*/
------------------------------------------------------------------------------------------------------

/*To get post from dashboard*/						  
						    (post-loop.php/post-excerpt.php)
							
					<?php if(have_posts()) :?>
					<?php while(have_posts()) :the_post(); ?>
					
					<?php endwhile;?>
					<?php endif;?>
----------------------------------------------------------------------------------------------
/*Post information in index.php or post-excerpt.php*/
	
<?php the_title();?>	/*To show post title*/			
<?php the_permalink();?> /*To link up the post*/				
<?php the_time('M d,Y');?>	/*To show the post time*/			
<?php the_excerpt();?>		/*Summary of the post*/		
<?php the_content();?>		/*To show the full post*/		
<?php the_category(',');?>	/*To show post category*/			
<?php comments_popup_link('No Comment','1 Comment','% Comment');?>	/*To show post comments number and to link up the post*/			
-------------------------------------------------------------------------------------------------

/*For pagination of a post*/
										(index.php)
					<div class="nav-previous"><?php next_posts_link( __( '<span class="meta-nav">&larr;</span> Older posts') ); ?></div>
					<div class="nav-next"><?php previous_posts_link( __( 'Newer posts <span class="meta-nav">&rarr;</span>') ); ?></div>
					
/*For Single post*/

					<?php if(have_posts()) :?>
					<?php while(have_posts()) : the_post(); ?>	
					<h2><?php the_title();?></h2>
					<?php the_content();?>
					<?php comments_template( '',true);?> /*To show comment box in single post*/
					<?php endwhile;?>
					<?php else : ?>
					<h3><?php _e('404 Error&#58; Not Found');?></h3>
					<?php endif;?>	
---------------------------------------------------------------------------------------------------					

/*archive.php*/
                    (to show archive title)
<h1 class="archivetitle">
    <?php if (have_posts()) : ?>
        <?php $post = $posts[0]; // Hack. Set $post so that the_date() works. ?>
            <?php /* If this is a category archive */ if (is_category()) { ?>
                <?php _e('Archive for the'); ?> '<?php echo single_cat_title(); ?>' <?php _e('Category'); ?>                                    
            <?php /* If this is a tag archive */  } elseif( is_tag() ) { ?>
                <?php _e('Archive for the'); ?> <?php single_tag_title(); ?> Tag
            <?php /* If this is a daily archive */ } elseif (is_day()) { ?>
                <?php _e('Archive for'); ?> <?php the_time('F jS, Y'); ?>                                        
            <?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
                <?php _e('Archive for'); ?> <?php the_time('F, Y'); ?>                                    
            <?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
                <?php _e('Archive for'); ?> <?php the_time('Y'); ?>                                        
            <?php /* If this is a search */ } elseif (is_search()) { ?>
                <?php _e('Search Results'); ?>                            
            <?php /* If this is an author archive */ } elseif (is_author()) { ?>
                <?php _e('Author Archive'); ?>                                        
            <?php /* If this is a paged archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
                <?php _e('Blog Archives'); ?>                                        
    <?php } ?>
</h1>

				(for archive post query)
				
<?php get_template_part('post-loop'); ?>	

				(if no post in archive or 404)

<?php else : ?>
    <h3><?php _e('404 Error&#58; Not Found'); ?></h3>
<?php endif; ?>				
--------------------------------------------------------------------------------------------------------------
/*page.php*/

					<?php if(have_posts()) :?>
					<?php while(have_posts()) : the_post(); ?>	
					<h2><?php the_title();?></h2>
					<?php the_content();?>
					<?php comments_template( '',true);?>
					<?php endwhile;?>
					<?php else : ?>
					<h3><?php _e('404 Error&#58; Not Found');?></h3>
					<?php endif;?>	

----------------------------------------------------------------------------------------------------------------
/*For comments reply ajax script*/

function comment_scripts(){
   if ( is_singular() ) wp_enqueue_script( 'comment-reply' );
}
add_action( 'wp_enqueue_scripts', 'comment_scripts' );
-----------------------------------------------------------------------------------------------------------------

/* This code for Featured Image Support */

			(functions.php)
add_theme_support( 'post-thumbnails', array( 'post' ) );
set_post_thumbnail_size( 200, 200, true );
add_image_size( 'post-image', 150, 150, true );

			(post-loop.php)
<?php the_post_thumbnail('post-image', array('class' => 'post-thumb')); ?>	
------------------------------------------------------------------------------------------------------------------		
/*For Dynamic menu*/

		(functions.php)

function wpj_register_menu() {
    if (function_exists('register_nav_menu')) {
        register_nav_menu( 'main-menu', __( 'Main Menu') );
    }
}
add_action('init', 'wpj_register_menu');	  

		(header.php)
	<?php wp_nav_menu( array( 'theme_location' => 'main-menu') ); ?>
-------------------------------------------------------------------------------

/* This code for readmore */
			(functions.php)
	function excerpt($num) {
	$limit = $num+1;
	$excerpt = explode(' ', get_the_excerpt(), $limit);
	array_pop($excerpt);
	$excerpt = implode(" ",$excerpt)." <a href='" .get_permalink($post->ID) ." ' class='".readmore."'>Read More</a>";
	echo $excerpt;
	}	

			(post-loop.php)/*Where the read more links needed*/
	<?php echo excerpt('60');?>	
----------------------------------------------------------------------------------
/*Query Posts from specific category*/

<?php query_posts('post_type=post&category_name=News&post_status=publish&posts_per_page=2&paged='. get_query_var('paged')); ?>	

----------------------------------------------------------------------------------
/* This is code for custom Post*/
    /* Register Custom Post Types********************************************/
						(functions.php)
            add_action( 'init', 'create_post_type' );
            function create_post_type() {
                    register_post_type( 'testimonial',
                            array(
                                    'labels' => array(
                                            'name' => __( 'Testimonial' ),
                                            'singular_name' => __( 'Testimonial' ),
                                            'add_new' => __( 'Add New' ),
                                            'add_new_item' => __( 'Add New Testimonial' ),
                                            'edit_item' => __( 'Edit Testimonial' ),
                                            'new_item' => __( 'New Testimonial' ),
                                            'view_item' => __( 'View Testimonial' ),
                                            'not_found' => __( 'Sorry, we couldn\'t find the Testimonial you are looking for.' )
                                    ),
                            'public' => true,
                            'publicly_queryable' => false,
                            'exclude_from_search' => true,
                            'menu_position' => 14,
                            'has_archive' => false,
                            'hierarchical' => false,
                            'capability_type' => 'page',
                            'rewrite' => array( 'slug' => 'testimonial' ),
                            'supports' => array( 'title', 'editor', 'custom-fields' ) /*If featured image is linked then,another parameter thumbnail will be included*/
                            )
                    );
            }
							(To show the custom post in page(sidebar.php))
							
					<?php query_posts('post_type=testimonial&post_status=publish&posts_per_page=1&paged='. get_query_var('paged')); ?>	
					<?php if(have_posts()) : ?>/*And the post loop will be called*/
					<?php while (have_posts()) : the_post(); ?>        
						<div class="single_testimonial fix">
							<div class="client_comment fix">
								<?php the_content(); ?>
							</div>
							<div class="client_name fix">
								<?php the_title(); ?>
							</div>
						</div>
					<?php endwhile; ?>    
					<?php endif; ?>		
--------------------------------------------------------------------------
/*Custom field*/					
	/*Display custom field data*/		
		<?php $key="url";echo get_post_meta($post->ID,$key,true);?>	
			
	/*Display custom field if exist*/
		<?php $image=get_post_meta($post->ID,'url',true);
		if($image) : ?>
			<img src="<?php echo $image;?>" alt=""/>
		<?php endif;?>
	
	/*Conditional Custom Field*/
		<?php
		$url=get_post_meta($post->ID,'url',true);
		if($url){
			echo $url;
		}else{
			the_permalink();
		}
		?>

--------------------------------------------------------------------------------
/*Using option tree make theme option*/

	/* This code for theme options */

	add_filter( 'ot_show_pages', '__return_false' );
	add_filter( 'ot_show_new_layout', '__return_false' );
	add_filter( 'ot_theme_mode', '__return_true' );
	include_once( 'option-tree/ot-loader.php' );
	
	include_once( 'includes/theme-options.php' );//call option tree
	
	/*create option tree in the theme*/
		//make includes folder in theme folder and make theme-options.php and keep there some code
			<?php
			add_action( 'admin_init', 'custom_theme_options', 1 );
			function custom_theme_options() {
			  $saved_settings = get_option( 'option_tree_settings', array() );
			  $custom_settings = array(
				'sections'        => array(
				  array(
					'id'          => 'general',
					'title'       => 'Site Settings'
				  ),
				  array(
					'id'          => 'social',
					'title'       => 'Social Setting'
				  )
				),
				'settings'        => array(
				  array(
					'id'          => 'logo_uploader',
					'label'       => 'Upload Your Logo',
					'desc'        => 'Best size for logo is 500px width, 200px height',
					'type'        => 'upload',
					'section'     => 'general'
				  )
				)
			  );

			  if ( $saved_settings !== $custom_settings ) {
				update_option( 'option_tree_settings', $custom_settings ); 
			  } 
			}
			 ?>	
		//To get data from option tree (index.php)
				<?php if ( function_exists( 'get_option_tree') ) : if( get_option_tree( 'Your_tree_id') ) : ?> //logo_uploader=id   
				<a href="<?php bloginfo('home'); ?>"><img src="<?php get_option_tree( 'Your_tree_id', '', 'true' ); ?>" alt=""/></a>
				<?php else : ?>
					Your Data
				<?php endif; endif; ?> 
		//for simple data
				<?php get_option_tree( 'facebook', '', 'true' );
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

































		
					