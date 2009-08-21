require 'opengl'
require 'node'

class Cube3
  def initialize
    @angle = Angle.new 30.0
  end

  def update
    @angle.circular :degree, 2, 0..360
  end

  def draw
    glPushMatrix
      glTranslatef(-5.0, 12.0, -40.0)
      glRotatef(@angle.degree, 0.5, 0.0, 0.0)
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
