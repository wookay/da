require 'opengl'
require 'scene'

module UIOpenGL
  include Scene

  def draw_scene
    draw_nodes
  end
  
  def update_scene value
    update_nodes
    glutTimerFunc 25, method(:update_scene).to_proc, 0
  end
  
  def show_window
    load_nodes

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
