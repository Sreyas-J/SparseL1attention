// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Mar  3 23:50:22 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sk/Desktop/SparseL1Attention/AttentionCore/AttentionCore.gen/sources_1/ip/Vi/Vi_sim_netlist.v
// Design      : Vi
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Vi,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module Vi
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [0:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [1:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [1:0]douta;

  wire [0:0]addra;
  wire clka;
  wire [1:0]dina;
  wire [1:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [1:0]NLW_U0_doutb_UNCONNECTED;
  wire [0:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "1" *) 
  (* C_ADDRB_WIDTH = "1" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.205164 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "Vi.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2" *) 
  (* C_READ_DEPTH_B = "2" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "2" *) 
  (* C_READ_WIDTH_B = "2" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2" *) 
  (* C_WRITE_DEPTH_B = "2" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "2" *) 
  (* C_WRITE_WIDTH_B = "2" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Vi_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(1'b0),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[1:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[1:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20480)
`pragma protect data_block
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
Gh2QxphgF/3VtbZtCvygoxI=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
