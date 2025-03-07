-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_btn_rom is 
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


architecture rtl of predict_ensemble_btn_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 5=> "0", 6 to 7=> "1", 8 to 10=> "0", 
    11 => "1", 12 to 13=> "0", 14 => "1", 15 to 16=> "0", 17 to 18=> "1", 19 => "0", 20 => "1", 
    21 to 23=> "0", 24 to 25=> "1", 26 to 27=> "0", 28 to 30=> "1", 31 => "0", 32 => "1", 33 to 34=> "0", 
    35 to 38=> "1", 39 to 41=> "0", 42 to 44=> "1", 45 => "0", 46 => "1", 47 to 50=> "0", 51 to 53=> "1", 
    54 to 55=> "0", 56 => "1", 57 to 59=> "0", 60 to 62=> "1", 63 to 64=> "0", 65 => "1", 66 => "0", 
    67 => "1", 68 => "0", 69 => "1", 70 => "0", 71 => "1", 72 to 74=> "0", 75 to 76=> "1", 
    77 to 82=> "0", 83 => "1", 84 to 87=> "0", 88 to 89=> "1", 90 => "0", 91 => "1", 92 => "0", 
    93 => "1", 94 => "0", 95 => "1", 96 => "0", 97 => "1", 98 to 101=> "0", 102 to 104=> "1", 
    105 => "0", 106 to 111=> "1", 112 => "0", 113 to 116=> "1", 117 => "0", 118 => "1", 119 => "0", 
    120 to 121=> "1", 122 => "0", 123 to 124=> "1", 125 to 128=> "0", 129 => "1", 130 to 134=> "0", 135 to 136=> "1", 
    137 to 138=> "0", 139 to 141=> "1", 142 to 145=> "0", 146 => "1", 147 to 148=> "0", 149 to 150=> "1", 151 to 152=> "0", 
    153 to 156=> "1", 157 => "0", 158 to 159=> "1", 160 => "0", 161 to 164=> "1", 165 => "0", 166 => "1", 
    167 => "0", 168 to 169=> "1", 170 to 171=> "0", 172 to 176=> "1", 177 => "0", 178 => "1", 179 => "0", 
    180 => "1", 181 => "0", 182 to 183=> "1", 184 => "0", 185 to 186=> "1", 187 to 194=> "0" );

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

entity predict_ensemble_btn is
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

architecture arch of predict_ensemble_btn is
    component predict_ensemble_btn_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_btn_rom_U :  component predict_ensemble_btn_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


