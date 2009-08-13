require 'opengl'

class Scene
  def self.draw_nodes &block
    glClear GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
    glClearColor 0.9, 0.9, 0.9, 1.0
    glMatrixMode(GL_MODELVIEW) # Switch to the drawing perspective
    glLoadIdentity() # reset the drawing perspective
    glTranslatef 0.0, 0.0, -10.0
    block.call
    glutSwapBuffers
  end
end
