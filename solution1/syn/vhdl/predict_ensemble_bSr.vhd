-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bSr_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_bSr_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 to 5=> "1", 6 => "0", 7 => "1", 8 => "0", 9 => "1", 10 => "0", 
    11 => "1", 12 to 13=> "0", 14 to 17=> "1", 18 to 19=> "0", 20 => "1", 21 => "0", 22 => "1", 
    23 => "0", 24 to 25=> "1", 26 => "0", 27 => "1", 28 => "0", 29 => "1", 30 to 36=> "0", 
    37 => "1", 38 to 39=> "0", 40 to 43=> "1", 44 => "0", 45 to 46=> "1", 47 => "0", 48 to 50=> "1", 
    51 to 53=> "0", 54 => "1", 55 => "0", 56 => "1", 57 => "0", 58 => "1", 59 to 62=> "0", 
    63 to 64=> "1", 65 => "0", 66 => "1", 67 => "0", 68 => "1", 69 => "0", 70 to 71=> "1", 
    72 => "0", 73 to 74=> "1", 75 => "0", 76 => "1", 77 => "0", 78 => "1", 79 => "0", 
    80 => "1", 81 to 84=> "0", 85 to 87=> "1", 88 => "0", 89 to 91=> "1", 92 to 93=> "0", 94 to 95=> "1", 
    96 to 97=> "0", 98 to 100=> "1", 101 to 102=> "0", 103 to 104=> "1", 105 to 112=> "0", 113 to 114=> "1", 115 => "0", 
    116 => "1", 117 => "0", 118 => "1", 119 => "0", 120 => "1", 121 to 122=> "0", 123 to 126=> "1", 
    127 => "0", 128 to 129=> "1", 130 => "0", 131 => "1", 132 => "0", 133 to 136=> "1", 137 => "0", 
    138 => "1", 139 => "0", 140 => "1", 141 => "0", 142 => "1", 143 => "0", 144 => "1", 
    145 to 146=> "0", 147 to 149=> "1", 150 to 153=> "0", 154 => "1", 155 to 157=> "0", 158 to 159=> "1", 160 => "0", 
    161 => "1", 162 => "0", 163 to 164=> "1", 165 to 166=> "0", 167 => "1", 168 to 170=> "0", 171 to 172=> "1", 
    173 to 175=> "0", 176 to 184=> "1", 185 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_bSr is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bSr is
    component predict_ensemble_bSr_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bSr_rom_U :  component predict_ensemble_bSr_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


