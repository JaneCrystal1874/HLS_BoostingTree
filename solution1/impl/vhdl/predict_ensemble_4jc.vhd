-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_4jc_rom is 
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


architecture rtl of predict_ensemble_4jc_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 => "1", 5 => "0", 6 => "1", 7 to 8=> "0", 9 => "1", 10 to 11=> "0", 
    12 to 14=> "1", 15 to 17=> "0", 18 => "1", 19 => "0", 20 => "1", 21 to 22=> "0", 23 to 24=> "1", 
    25 => "0", 26 => "1", 27 to 28=> "0", 29 => "1", 30 => "0", 31 to 33=> "1", 34 to 38=> "0", 
    39 to 40=> "1", 41 to 42=> "0", 43 to 44=> "1", 45 => "0", 46 => "1", 47 to 48=> "0", 49 => "1", 
    50 => "0", 51 => "1", 52 to 54=> "0", 55 => "1", 56 => "0", 57 => "1", 58 => "0", 
    59 to 62=> "1", 63 to 66=> "0", 67 to 69=> "1", 70 => "0", 71 => "1", 72 => "0", 73 => "1", 
    74 to 75=> "0", 76 => "1", 77 to 78=> "0", 79 => "1", 80 to 83=> "0", 84 => "1", 85 to 87=> "0", 
    88 to 89=> "1", 90 to 94=> "0", 95 => "1", 96 => "0", 97 to 102=> "1", 103 => "0", 104 => "1", 
    105 to 106=> "0", 107 to 108=> "1", 109 to 110=> "0", 111 => "1", 112 => "0", 113 => "1", 114 => "0", 
    115 => "1", 116 to 117=> "0", 118 => "1", 119 => "0", 120 to 122=> "1", 123 => "0", 124 to 128=> "1", 
    129 to 130=> "0", 131 => "1", 132 => "0", 133 => "1", 134 to 136=> "0", 137 to 138=> "1", 139 to 141=> "0", 
    142 to 144=> "1", 145 => "0", 146 => "1", 147 to 148=> "0", 149 to 150=> "1", 151 => "0", 152 => "1", 
    153 => "0", 154 to 160=> "1", 161 => "0", 162 => "1", 163 to 164=> "0", 165 to 168=> "1", 169 => "0", 
    170 to 172=> "1", 173 => "0", 174 => "1", 175 => "0", 176 => "1", 177 => "0", 178 to 180=> "1", 
    181 to 194=> "0" );

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

entity predict_ensemble_4jc is
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

architecture arch of predict_ensemble_4jc is
    component predict_ensemble_4jc_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_4jc_rom_U :  component predict_ensemble_4jc_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


