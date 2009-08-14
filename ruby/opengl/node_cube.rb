require 'opengl'
require 'node'

class Cube
  def initialize
    @translate = Vector3.new -4.0, -5.0, 0.0
  end

  def update
    @translate.step_in_bound :z, 0.4, -60..-30
  end

  def draw
    glPushMatrix
      glTranslatef(@translate.x, @translate.y, @translate.z)
      glRotatef(230, 0.5, 0.5, 0.0)
      glBegin(GL_QUADS)
        glColor3f(1.0, 1.0, 0.0)
        glVertex3f(-2.0, -2.0, 2.0)
        glVertex3f(2.0, -2.0, 2.0)
        glVertex3f(2.0, 2.0, 2.0)
        glVertex3f(-2.0, 2.0, 2.0)
        
        glColor3f(1.0, 0.0, 0.0)
        glVertex3f(2.0, -2.0, -2.0)
        glVertex3f(2.0, 2.0, -2.0)
        glVertex3f(2.0, 2.0, 2.0)
        glVertex3f(2.0, -2.0, 2.0)
        
        glColor3f(0.0, 1.0, 0.0)
        glVertex3f(-2.0, -2.0, -2.0)
        glVertex3f(-2.0, 2.0, -2.0)
        glVertex3f(2.0, 2.0, -2.0)
        glVertex3f(2.0, -2.0, -2.0)
        
        glColor3f(0.0, 1.0, 1.0)
        glVertex3f(-2.0, -2.0, -2.0)
        glVertex3f(-2.0, -2.0, 2.0)
        glVertex3f(-2.0, 2.0, 2.0)
        glVertex3f(-2.0, 2.0, -2.0)
        
        glColor3f(0.0, 0.0, 1.0)
        glVertex3f(2.0, 2.0, 2.0)
        glVertex3f(2.0, 2.0, -2.0)
        glVertex3f(-2.0, 2.0, -2.0)
        glVertex3f(-2.0, 2.0, 2.0)
      glEnd()
    glPopMatrix
  end
end
