package pract1;
import javax.swing.JOptionPane;
import java.util.Random;
/**
 *
 * @author Usuario
 * 1.- Es Tijera 2- Papel 3.- Roca
 */
public class Pract1 {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        do{
        winPlay(eleccionJg(),eleccionCPU());
        }while(repetir() == 1);
    }
    
    public static int eleccionCPU(){
        int NumRand;
        Random rnd = new Random();
        NumRand = rnd.nextInt(3);
        switch (NumRand) {
            case 1:
                JOptionPane.showMessageDialog(null,"La CPU eligio Tijeras");
                break;
            case 2:
                JOptionPane.showMessageDialog(null,"La CPU eligio Papel");
                break;
            default:
                JOptionPane.showMessageDialog(null,"La CPU eligio Roca");
                break;
        }
        return NumRand;
    }

    public static int eleccionJg(){
        int NumJg;
        String c;
        c = JOptionPane.showInputDialog("¿Que va a elegir?[1-Tijeras/2-Papel/3-Roca]");
        NumJg = Integer.parseInt(c);
        return NumJg;
    }
    
    public static int repetir(){
        int rep;
        String c;
        c = JOptionPane.showInputDialog("¿Desea Repetir?[1-Si/2-No");
        rep = Integer.parseInt(c);
        return rep;
    }
    
    public static boolean winPlay(int selJg, int selCPU){
    if(selJg == selCPU){
        JOptionPane.showMessageDialog(null,"Han Empatado");
        return true;
    }else if(selJg == 3 && selCPU == 1){
        JOptionPane.showMessageDialog(null,"Usted a Ganado");
        return true;
    }else if(selCPU == 3 && selJg == 1){
        JOptionPane.showMessageDialog(null,"Suerte la proxima");
        return false;
    }else if(selJg < selCPU){
        JOptionPane.showMessageDialog(null,"Usted a Ganado");
        return true;
    }else if(selJg > selCPU){
        JOptionPane.showMessageDialog(null,"Suerte la proxima");
        return false;
    }
    return false;
    }
}
