require 'opengl'
require 'scene'

module UIOpenGL
  def load_scene
    @scene = Scene.new
    require 'node_cube'
    require 'node_cube2'
    require 'node_cube3'
    @nodes = [Cube.new, Cube2.new, Cube3.new]
  end

  def draw_scene
    @scene.draw_nodes do
      @nodes.each do |node|
        node.draw
      end
    end
  end
  
  def update_scene value
    @scene.update_nodes do
      @nodes.each do |node|
        node.update
      end
    end
    glutTimerFunc 25, method(:update_scene).to_proc, 0
  end
  
  def show_window
    load_scene

    glutInit
    glutInitWindowSize 480, 320
    glutCreateWindow 
    glutDisplayFunc method(:draw_scene).to_proc
    glutTimerFunc 25, method(:update_scene).to_proc, 0

  	glEnable GL_DEPTH_TEST
  	glEnable GL_COLOR_MATERIAL
  	glMatrixMode GL_PROJECTION
    glViewport 0, 0, 0, 0
  	glClearColor 0.9, 0.9, 0.9, 1.0
    gluPerspective 60.0, 0.5, 1.0, 200.0
    glutMainLoop
  end

  def start_opengl
    Thread.abort_on_exception = true
    Thread.new do
      @status = {}
      loop do
        autoload_save_files
        sleep 1
      end
    end
    Thread.new do
      show_window
    end
  end 

  def stop_opengl
  end

  def autoload_save_files
    Dir['*.rb'].each do |lib|
      file, mtime = @status[lib]
      if file
        curtime = File.mtime(file).to_i
        if mtime < curtime
          load file
          @status[lib] = [file, curtime]
        end
      else
        file = lib
        curtime = File.mtime(file).to_i
        @status[lib] = [file, curtime]
      end
    end 
  end
end
