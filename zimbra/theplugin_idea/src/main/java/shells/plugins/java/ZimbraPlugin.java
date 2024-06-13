package shells.plugins.java;

import com.theplutin.UI;
import core.Encoding;
import core.annotation.PluginAnnotation;
import core.imp.Payload;
import core.imp.Plugin;
import core.shell.ShellEntity;

import javax.swing.*;
import java.awt.*;

@PluginAnnotation(
        payloadName = "JavaDynamicPayload",
        Name = "ZimbraPlugin",
        DisplayName = "ZimbraPlugin"
)
public class ZimbraPlugin implements Plugin {
    private ShellEntity shellEntity;
    private JPanel corePanel;
    private UI coreUI;
    private Payload payload;
    private Encoding encoding;

    public ZimbraPlugin() {
        coreUI = new UI();
        corePanel = new JPanel(new GridBagLayout());
        corePanel.add(coreUI, new GridBagConstraints());
    }

    public Payload getPayload() {
        return payload;
    }

    public Encoding getEncoding() {
        return encoding;
    }

    @Override
    public void init(ShellEntity shellEntity) {
        this.shellEntity = shellEntity;
        this.encoding = shellEntity.getEncodingModule();
        this.payload = shellEntity.getPayloadModule();
        coreUI.encoding = this.encoding;
        coreUI.payload = payload;

        //        payload.include("asd", "".getBytes());
//        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
//        reqParameter.add("Aa","ASD");
//       encoding.Decoding( payload.evalFunc("asd", "aaa", reqParameter));
    }

    @Override
    public JPanel getView() {
        return corePanel;
    }
}
