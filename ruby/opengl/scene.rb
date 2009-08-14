require 'opengl'
require 'node'

class Scene
  def initialize
    @translate = Vector3.new 0, 0, 0
  end
  def update_nodes &block
    #@translate.step_in_bound :x, 0.1, -5..5
    block.call
    glutPostRedisplay
  end
  def draw_nodes &block
    glClear GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
    glMatrixMode GL_MODELVIEW
    glLoadIdentity
    glTranslatef @translate.x, @translate.y, @translate.z
    block.call
    glutSwapBuffers
  end
end
